module Coinfresh
  module Api
    class CashFlow < Base

      include Coinfresh::ApiOperation::List


      private

      def data_klass(*args)
        Coinfresh::Model::CashFlow
      end

      def end_point_url;     'cash_flows';  end
      def plural_resource;   'cash_flows';  end
      def singular_resource; 'cash_flow';   end

    end
  end
end