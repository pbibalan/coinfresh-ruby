module Coinfresh
  module Model
    class Withdraw < Base
      set_attributes(id:           {type: :int, readonly: true},                                  
                    created_at:    {type: :string, readonly: true},                     
                    address:       {type: :string, readonly: true},    
                    amount:        {type: :decimal, readonly: true},      
                    txid:          {type: :string, readonly: true},   
                    status:        {type: :string, readonly: true},                      
                  )

      has_association :wallet,  Coinfresh::Model::Wallet

      private
      def api
        client.withdraws
      end

    end
  end
end