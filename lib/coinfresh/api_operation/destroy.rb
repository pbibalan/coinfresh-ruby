module Coinfresh
  module ApiOperation
    module Destroy

      def destroy(id)
        client.delete("#{end_point_url}/#{id}", false)
      end

    end
  end
end