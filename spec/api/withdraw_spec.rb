require 'spec_helper'

module Coinfresh
  module Api
    describe Withdraw, :vcr do      

      describe "#list" do
        it "gets all the wallets" do
          withdraws = client.withdraws.list(wallet_id: 2)
          expect(withdraws.count).to be > 0
          withdraw = withdraws.first
          expect(withdraw.id).not_to be_nil
          expect(withdraw.created_at).not_to be_nil
          expect(withdraw.address).not_to be_nil
          expect(withdraw.amount).not_to be_nil
          expect(withdraw.status).not_to be_nil
          expect(withdraw.txid).not_to be_nil    
          expect(withdraw.wallet).not_to be_nil
        end
      end

      describe "#create" do
        it "creates a wallet with the given id" do
          withdraw = client.withdraws.create(
            {address: "mxcA1w3sEfWUjjRYSUozFxzdiiHwK4dptF", amount: 0.001},
            {password: "password", wallet_id: 2}
          )

          expect(withdraw.id).not_to be_nil
          expect(withdraw.created_at).not_to be_nil
          expect(withdraw.address).not_to be_nil
          expect(withdraw.amount).not_to be_nil
          expect(withdraw.status).not_to be_nil   
          expect(withdraw.wallet).not_to be_nil
        end        
      end

     
    end

  end

end