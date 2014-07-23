module Coinfresh
  module Api
    class Currency < Base

      include Coinfresh::ApiOperation::List

      private

      def data_klass(*args)
        Coinfresh::Model::Currency
      end

      def end_point_url;     'currencies';  end
      def plural_resource;   'currencies';  end
      def singular_resource; 'currency';   end

    end
  end
end