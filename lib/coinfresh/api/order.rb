module Coinfresh
  module Api
    class Order < Base

      include Coinfresh::ApiOperation::List
      include Coinfresh::ApiOperation::Find
      include Coinfresh::ApiOperation::Create
      include Coinfresh::ApiOperation::New

      def my(params = {})
        response = client.get("#{end_point_url}/my", params)
        response[plural_resource].collect{ |r| data_item(r) }
      end

      def cancel(id)
        response = client.post("#{end_point_url}/#{id}/cancel")
        data_item(response[singular_resource])
      end
      
      def cancel_market(market_id)
        params = { market_id: market_id }
        response = client.put("#{end_point_url}/cancel_all")
        response[plural_resource].collect{ |r| data_item(r) }
      end

      def cancel_all
        response = client.put("#{end_point_url}/cancel_all")
        response[plural_resource].collect{ |r| data_item(r) }
      end
      
      private

      def data_klass(*args)
        Coinfresh::Model::Order
      end

      def end_point_url;     'orders';  end
      def plural_resource;   'orders';  end
      def singular_resource; 'order';   end

    end
  end
end