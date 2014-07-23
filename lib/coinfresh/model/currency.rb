module Coinfresh
  module Model
    class Currency < Base
      set_attributes(id:              {type: :int, readonly: true},
                   created_at:        {type: :datetime, readonly: true},
                   updated_at:        {type: :datetime, readonly: true}, 
                   name:              {type: :string, readonly: true},
                   ticker:            {type: :string, readonly: true},
                   withdraw_transaction_fee: {type: :decimal, readonly: true}

                  )

      private
      def api
        client.currencies
      end

    end
  end
end