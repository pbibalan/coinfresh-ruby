require 'spec_helper'

module Coinfresh
  module Api
    describe Order, :vcr do      

      describe "#my" do
        it "gets all the orders" do
          my_orders = client.orders.my
          expect(my_orders.count).to be > 0
          order = my_orders.first
          expect(order.order_type).not_to be_nil
          expect(order.amount).not_to be_nil
          expect(order.price).not_to be_nil
          expect(order.market_id).not_to be_nil
          expect(order.filled_amount).not_to be_nil
          expect(order.status).not_to be_nil
        end
      end

      describe "#create" do
        let(:order_param){
          {
            'order_type' => "buy",
            'amount' => 0.001,
            'price' => 0.001,
            'market_id' => 2 
          }
        }
        it "creates an order" do
          order = client.orders.new(order_param)
          returned_order = order.save
          expect(returned_order.id).not_to be_nil        
          expect(returned_order.order_type).to eql order_param['order_type'] 
          expect(returned_order.amount).to eql order_param['amount'] 
          expect(returned_order.price).to eql order_param['price'] 
          expect(returned_order.market_id).to eql order_param['market_id'] 
          expect(returned_order.filled_amount).to eql 0.0
          expect(returned_order.status).to eql "active"
        end
      end

      describe "#cancel" do        
        it "cancels an order" do          
          returned_order = client.orders.cancel(18)
          expect(returned_order.id).not_to be_nil      
          expect(returned_order.status).to eql "cancelled"
        end
      end
      
    end

  end

end