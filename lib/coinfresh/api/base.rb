module Coinfresh
  module Api
    class Base     
      
      attr_accessor :client

      def initialize(client)
        self.client = client
      end

      private
      def data_item(params)
        data_klass(params).new(params, client)
      end

    end
  end
end