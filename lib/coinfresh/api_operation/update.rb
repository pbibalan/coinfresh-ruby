module Coinfresh
  module ApiOperation
    module Update

      def update(id, params = {})
        response = client.put("#{end_point_url}/#{id}", {singular_resource => params}.to_json)
        data_item(response[singular_resource])        
      end
    
    end
  end
end