module Coinfresh
  module Model
    class Trade < Base
      set_attributes(id:              {type: :int, readonly: true},
                   created_at:        {type: :datetime, readonly: true},                   
                   amount:            {type: :decimal, readonly: true},
                   price:             {type: :decimal, readonly: true},                   
                   buy_order_id:      {type: :int, readonly: true},
                   sell_order_id:     {type: :int, readonly: true}
                  )

      private
      def api
        client.markets
      end
    end
  end
end