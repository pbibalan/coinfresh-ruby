module CoinFresh
  module Api
    class Wallet < Base

      include Coinfresh::ApiOperation::List
      include Coinfresh::ApiOperation::Create


      private

      def data_klass(*args)
        Coinfresh::Model::Wallet
      end

      def end_point_url;     'wallets';  end
      def plural_resource;   'wallets';  end
      def singular_resource; 'wallet';   end

    end
  end
end