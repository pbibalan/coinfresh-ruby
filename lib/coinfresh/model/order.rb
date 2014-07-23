module Coinfresh
  module Model
    class Order < Base
      set_attributes(id:              {type: :int, readonly: true},
                   created_at:        {type: :datetime, readonly: true},
                   updated_at:        {type: :datetime, readonly: true},
                   filled_amount:     {type: :decimal, readonly: true},
                   status:            {type: :string},
                   order_type:        {type: :string},
                   amount:            {type: :decimal},
                   price:             {type: :decimal},
                   market_id:         {type: :integer}
                  )

      private
      def api
        client.orders
      end

    end
  end
end