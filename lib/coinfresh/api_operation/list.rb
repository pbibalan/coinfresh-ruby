module Coinfresh
  module ApiOperation
    module List

      def list(params = {})        
        response = client.get(end_point_url, params)
        response[plural_resource].collect{ |r| data_item(r) }
      end
      
    end

  end
end