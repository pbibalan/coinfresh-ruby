require 'spec_helper'

module Coinfresh
  module Api
    describe CashFlow, :vcr do      

      describe "#list" do
        it "gets all the cashflows for currency" do
          cash_flows = client.cash_flows.list(limit: 2, currency: 'BTC')
          expect(cash_flows.count).to be > 0
          cash_flow = cash_flows.first
          expect(cash_flow.id).not_to be_nil
          expect(cash_flow.created_at).not_to be_nil
          expect(cash_flow.amount).not_to be_nil
          expect(cash_flow.cash_type).not_to be_nil          
        end
      end
      
    end

  end

end