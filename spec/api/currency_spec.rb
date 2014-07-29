require 'spec_helper'

module Coinfresh
  module Api
    describe Currency, :vcr do      

      describe "#list" do
        it "gets all the currencies" do
          currencies = client.currencies.list
          expect(currencies.count).to be > 0
          currency = currencies.first
          expect(currency.id).not_to be_nil
          expect(currency.name).not_to be_nil
          expect(currency.ticker).not_to be_nil
          expect(currency.withdraw_transaction_fee).not_to be_nil
          expect(currency.deposit_confirmations).not_to be_nil
        end
      end
      
    end

  end

end