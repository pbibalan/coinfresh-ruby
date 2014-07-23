module Coinfresh
  module ApiOperation
    module Create

      def create(params = {})
        response = client.post(end_point_url, {singular_resource => params}.to_json)
        data_item(response[singular_resource])        
      end
      
    end
  end
end