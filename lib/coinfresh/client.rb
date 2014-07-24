module Coinfresh
  
  class Client

    class << self      
      attr_accessor :base_scope_url
    end
  
    self.base_scope_url = 'http://localhost:3000' #ENV["coinfresh_base_url"]
    
    include Coinfresh::Http        

    attr_accessor :access_token
    attr_accessor :end_points

    def initialize(credentials = {})
      self.access_token = credentials[:access_token]
      self.end_points = {}
    end

    { 
      markets:        Coinfresh::Api::Market,
      orders:         Coinfresh::Api::Order,
      currencies:     Coinfresh::Api::Currency,
      wallets:        Coinfresh::Api::Wallet           
    }.each_pair do |method, klass| 
      define_method method do
        end_points[method] ||= klass.new(self)
      end
    end         
  end


end