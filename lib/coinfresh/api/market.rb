module CoinFresh
  module Api
    class Market < Base

      include Coinfresh::ApiOperation::List
      include Coinfresh::ApiOperation::Find


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