require "coinfresh/version"
require 'api-auth'
require 'net/http'
require 'json'

module Coinfresh
  
  { 
    :Http =>            'http',
    :Client =>          'client'
  }.each_pair do |klass, file| 
    autoload klass, "coinfresh/#{file}"
  end

  
  module Model
    {
      :Base =>                'base',
      :Currency =>            'currency',
      :Market =>              'market',
      :Order =>               'order',
      :Wallet =>              'wallet'
    }.each_pair do |klass, file| 
      autoload klass, "coinfresh/model/#{file}"
    end
  end

  module ApiOperation
    {
      :Create =>              'create',
      :Destroy =>             'destroy',
      :Find =>                'find',
      :List =>                'list',
      :Update =>              'update',
      :New =>                 'new'
    }.each_pair do |klass, file| 
      autoload klass, "coinfresh/api_operation/#{file}"
    end
  end

  module Api

    {
      :Base =>              'base',
      :Currency =>          'currency',
      :Market =>            'market',
      :Order =>             'order',
      :Wallet =>            'wallet'      
    }.each_pair do |klass, file| 
      autoload klass, "coinfresh/api/#{file}"
    end

  end

end