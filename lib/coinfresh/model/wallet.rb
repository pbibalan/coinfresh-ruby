module Coinfresh
  module Model
    class Wallet < Base
      set_attributes(id:                {type: :int, readonly: true},                                  
                    balance:            {type: :decimal, readonly: true}, 
                    deposit_address:    {type: :string, readonly: true},    
                    in_escrow:          {type: :decimal, readonly: true},      
                    total_withdraw:     {type: :decimal, readonly: true},
                    total_deposit:      {type: :decimal, readonly: true},
                    unconfirmed_deposit: {type: :decimal, readonly: true},
                  )

      has_association :currency,  Coinfresh::Model::Currency

      private
      def api
        client.wallets
      end

    end
  end
end