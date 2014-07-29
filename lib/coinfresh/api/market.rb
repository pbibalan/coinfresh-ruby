module Coinfresh
  module Api
    class Market < Base

      include Coinfresh::ApiOperation::List
      include Coinfresh::ApiOperation::Find

      def trades(id)
        response = client.get("#{end_point_url}/#{id}/trades")        
        response['trades'].collect {|r| Coinfresh::Model::Trade.new(r, client) }
      end

      private

      def data_klass(*args)
        Coinfresh::Model::Market
      end

      def end_point_url;     'markets';  end
      def plural_resource;   'markets';  end
      def singular_resource; 'market';   end

    end
  end
end