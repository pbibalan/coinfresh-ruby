require 'spec_helper'

module Coinfresh
  module Api
    describe Market, :vcr do
      let(:client) { Coinfresh::Client.new({access_token: 'dLXRyDy78ifx2robPiU5'}) }

      describe "#list" do
        it "gets all the markets" do
         markets = client.markets.list
         expect(markets.count).to be > 0
         market = markets.first
         expect(market.currency).not_to be_nil
         expect(market.base_currency).not_to be_nil
        end
      end
      
    end

  end

end