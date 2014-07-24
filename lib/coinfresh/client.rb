module Coinfresh
  
  class Client

    class << self      
      attr_accessor :base_scope_url
    end
  
    self.base_scope_url = 'https://coinfresh.com' #ENV["coinfresh_base_url"]
    
    include Coinfresh::Http        

    attr_accessor :access_token
    attr_accessor :secret_key
    attr_accessor :end_points

    def initialize(options = {})
      self.access_token = options[:access_token]
      self.secret_key = options[:secret_key]     
      Coinfresh::Client.base_scope_url = options[:base_uri] if options[:base_uri]
      self.end_points = {}
    end

    { 
      markets:        Coinfresh::Api::Market,
      orders:         Coinfresh::Api::Order,
      currencies:     Coinfresh::Api::Currency,
      wallets:        Coinfresh::Api::Wallet           
    }.each_pair do |method, klass| 
      define_method method do
        end_points[method] ||= klass.new(self)
      end
    end         
  end


end