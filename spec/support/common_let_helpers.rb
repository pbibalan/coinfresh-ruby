require 'rspec/core/shared_context'

module CommonLetHelpers
  extend RSpec::Core::SharedContext

  let(:cryptsy_ex){
    create(:exchange, name: 'Cryptsy')
  }
  let(:pa_ex){
    create(:exchange, name: 'PlanetAltcoin')
  }

  let(:btc) { 
    create(:currency, name: "Bitcoin", ticker: "BTC")
  }
  let(:ltc) { 
    create(:currency, name: "Litecoin", ticker: "LTC")
  }
  let(:doge) { 
    create(:currency, name: "Dogecoin", ticker: "DOGE")
  }

  let(:market_btc_ltc){
    create(:market, base_currency: btc, currency: ltc)
  }
  
  let(:market_doge_btc){
    create(:market, base_currency: doge, currency: btc )
  }

  let(:ex_market_pa_btc_ltc){
    create(:exchange_market, exchange: pa_ex, market: market_btc_ltc, remote_market_id: 10)
  }
  let(:ex_market_cryptsy_btc_ltc){
    create(:exchange_market, exchange: cryptsy_ex, market: market_btc_ltc, remote_market_id: 20)
  }
  
  let(:ex_market_pa_doge_btc){
    create(:exchange_market, exchange: pa_ex, market: market_doge_btc, remote_market_id: 2)
  }
  let(:ex_market_cryptsy_doge_btc){
    create(:exchange_market, exchange: cryptsy_ex, market: market_doge_btc, remote_market_id: 132)
  }

  let!(:buy_ltc_btc_order){ 
    {
      market_id: 1,
      order_type: "buy",         
      amount: 10, 
      price:0.02
    }
  }

  let(:client) { 
    Coinfresh::Client.new({
      access_token: 'da5AgdjTchH4a5APfkBRVW8jQ6zdbiQPD2i3huaY', 
      secret_key: 'jbxZyk1/L40fVBv1nfc2F9Tpx99m+SeCeEKWispNwQW4vuazShusLeaFlYp/DcR++kvu442Cpq0iemBT50DZtw==', 
      base_uri: 'http://localhost:3000'
    })
  }

end