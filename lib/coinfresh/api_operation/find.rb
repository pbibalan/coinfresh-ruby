module Coinfresh
  module ApiOperation
    module Find
      
      def find(id)
        begin
          response = client.get("#{end_point_url}/#{id}")
          data_item(response[singular_resource])
        rescue Coinfresh::Model::ResourceNotFound
          nil
        end
      end

    end
  end
end