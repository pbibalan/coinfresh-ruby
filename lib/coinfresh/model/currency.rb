module Coinfresh
  module Model
    class Currency < Base
      set_attributes(id:              {type: :int, readonly: true},                  
                   name:              {type: :string, readonly: true},
                   ticker:            {type: :string, readonly: true},
                   withdraw_transaction_fee: {type: :decimal, readonly: true},
                   deposit_confirmations: {type: :int, readonly: true}
                  )

      private
      def api
        client.currencies
      end

    end
  end
end