module Coinfresh
  module Api
    class Withdraw < Base

      include Coinfresh::ApiOperation::List
      include Coinfresh::ApiOperation::Create


      private

      def data_klass(*args)
        Coinfresh::Model::Withdraw
      end

      def end_point_url;     'withdraws';  end
      def plural_resource;   'withdraws';  end
      def singular_resource; 'withdraw';   end

    end
  end
end