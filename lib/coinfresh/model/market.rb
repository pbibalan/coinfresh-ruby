module Coinfresh
  module Model
    class Market < Base
      set_attributes(id:              {type: :int, readonly: true},
                   name:              {type: :string, readonly: true},
                   last_price:        {type: :decimal, readonly: true}
                  )

      has_association :base_currency,       Coinfresh::Model::Currency
      has_association :currency,            Coinfresh::Model::Currency

      private
      def api
        client.markets
      end
    end
  end
end