module Coinfresh
  module ApiOperation
    module Create

      def create(params = {}, params_extra={})
        response = client.post(end_point_url, {singular_resource => params}.merge(params_extra).to_json)
        data_item(response[singular_resource])        
      end
      
    end
  end
end