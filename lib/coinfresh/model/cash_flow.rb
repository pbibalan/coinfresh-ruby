module Coinfresh
  module Model
    class CashFlow < Base
      set_attributes(id:              {type: :int, readonly: true},                  
                   created_at:         {type: :datetime, readonly: true},
                   cash_type:         {type: :string, readonly: true},
                   amount:            {type: :decimal, readonly: true}                   
                  )

      private
      def api
        client.cash_flows
      end

    end
  end
end