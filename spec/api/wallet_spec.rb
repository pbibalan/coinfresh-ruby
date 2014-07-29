require 'spec_helper'

module Coinfresh
  module Api
    describe Wallet, :vcr do      

      describe "#list" do
        it "gets all the wallets" do
          wallets = client.wallets.list
          expect(wallets.count).to be > 0
          wallet = wallets.first
          expect(wallet.id).not_to be_nil
          expect(wallet.balance).not_to be_nil
          expect(wallet.deposit_address).not_to be_nil
          expect(wallet.in_escrow).not_to be_nil
          expect(wallet.total_withdraw).not_to be_nil
          expect(wallet.unconfirmed_deposit).not_to be_nil
          expect(wallet.currency).not_to be_nil          
        end
      end

      describe "#create" do
        it "creates a wallet with the given id" do
          wallet = client.wallets.create(currency_id: 4)
          expect(wallet.id).not_to be_nil
          expect(wallet.balance).not_to be_nil
          expect(wallet.deposit_address).not_to be_nil
          expect(wallet.in_escrow).not_to be_nil
          expect(wallet.total_withdraw).not_to be_nil
          expect(wallet.unconfirmed_deposit).not_to be_nil
          expect(wallet.currency).not_to be_nil          
        end        
      end

     
    end

  end

end