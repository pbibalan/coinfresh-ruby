require 'api-auth'

module Coinfresh
  
  module Http
    class Unauthorized < Exception; end 
    class ResourceNotFound < Exception; end
    class BadRequest < Exception; end

    def base_uri(path, params = {})        
      uri = URI.parse(self.class.base_scope_url)
      uri.path = path
      uri.query = URI.encode_www_form(params) if params.any?
      uri
    end

    def get(path, params ={}, parse=true)
      uri = base_uri("#{api_prefix}/#{path}", params)
      req = Net::HTTP::Get.new(uri.request_uri)
      make_api_request(req, uri, parse)
    end

    def put(path, body = "", parse=true)
      uri = base_uri("#{api_prefix}/#{path}")        
      req = Net::HTTP::Put.new(uri.request_uri)
      req.body = body
      req.add_field("Content-Type", "application/json")
      make_api_request(req, uri, parse)
    end

    def multipart_post(path, params, parse = true)
      uri = base_uri("#{api_prefix}/#{path}")        
      req = Net::HTTP::Post::Multipart.new(uri.request_uri, params)
      make_api_request(req, uri, parse)
    end

    def post(path, body ="", parse = true)        
      uri = base_uri("#{api_prefix}/#{path}")        
      req = Net::HTTP::Post.new(uri.request_uri)
      req.body = body
      req.add_field("Content-Type", "application/json")
      make_api_request(req, uri, parse)
    end

    def delete(path, parse=true)
      uri = base_uri("#{api_prefix}/#{path}")
      req = Net::HTTP::Delete.new(uri.request_uri)
      make_api_request(req, uri, parse)
    end

    def make_api_request(req, uri, parse = true)        
      if self.access_token && self.secret_key
        req = ApiAuth.sign!(req, self.access_token, self.secret_key)      
      end
      make_request(req, uri, parse)
    end

    def make_request(req, uri, parse = true)
      req.add_field("Accept", "text/json")
      n = Net::HTTP.new(uri.host, uri.port)
      if uri.scheme == "https"
        n.use_ssl = true        
      end
      res = n.start do |http|
        http.request(req)
      end      
      parse_response(res, parse)
    end

    def parse_response(res, parse)
      if res.body !~ /^\s*$/ && !res.body.nil?
        body = parse ? JSON.parse(res.body) : res.body
      end

      case res
      when Net::HTTPNotFound
        raise Coinfresh::Http::ResourceNotFound.new(body["message"])
      when Net::HTTPSuccess
        body
      when Net::HTTPUnauthorized
        raise Coinfresh::Http::Unauthorized.new(body["message"])
      when Net::HTTPBadRequest
        message = ""
        if body["error"] 
          message = [body["error"].to_s, body["message"].to_s].join(" ")
        end

        if body["errors"]
          message = body["errors"]
        end

        raise Coinfresh::Http::BadRequest.new(message)        
      when Net::HTTPSeeOther
        res["Location"]
      else
        raise "Unknown #{res.class} response. #{body["message"]}"
      end
    end

    private
    
    def api_prefix; "/api/v1"; end

  end
  
end