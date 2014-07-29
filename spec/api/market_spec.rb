require 'spec_helper'

module Coinfresh
  module Api
    describe Market, :vcr do

      describe "#list" do
        it "gets all the markets" do
         markets = client.markets.list
         expect(markets.count).to be > 0
         market = markets.first
         expect(market.id).not_to be_nil
         expect(market.last_price).not_to be_nil
         expect(market.name).not_to be_nil
         expect(market.currency).not_to be_nil
         expect(market.base_currency).not_to be_nil
         expect(market.currency.ticker).not_to be_nil
         expect(market.base_currency.ticker).not_to be_nil
        end
      end

      describe "#find" do
        it "gets a market with the given id" do
          market = client.markets.find(1)
          expect(market.id).not_to be_nil
          expect(market.last_price).not_to be_nil
          expect(market.name).not_to be_nil
          expect(market.currency).not_to be_nil
          expect(market.base_currency).not_to be_nil
          expect(market.currency.ticker).not_to be_nil
          expect(market.base_currency.ticker).not_to be_nil  
        end
      end

      describe "#trades" do
        it "gets all trades for a market" do
          trades = client.markets.trades(1)
          trade = trades.first
          expect(trade.id).not_to be_nil
          expect(trade.created_at).not_to be_nil
          expect(trade.amount).not_to be_nil
          expect(trade.price).not_to be_nil
          expect(trade.buy_order_id).not_to be_nil
          expect(trade.sell_order_id).not_to be_nil
        end
      end

    end   

  end

end