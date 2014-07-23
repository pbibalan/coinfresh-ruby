require "coinfresh/version"
require 'net/http'
require 'json'

module Coinfresh
  
  { 
    :Base =>          'base',
    :Http =>          'http',
  }.each_pair do |klass, file| 
    autoload klass, "clio_client/#{file}"
  end

  # Model
  {
    :Base =>                'base',
    :Currency =>            'currency',
    :Market =>              'market',
    :Order =>               'order',
    :Wallet =>              'wallet'
  }.each_pair do |klass, file| 
    autoload klass, "coinfresh/model/#{file}"
  end

  # Operation
  {
    :Create =>              'create',
    :Destroy =>             'destroy',
    :Find =>                'find',
    :List =>                'list',
    :Update =>              'update'
  }.each_pair do |klass, file| 
    autoload klass, "coinfresh/api_operation/#{file}"
  end

  # API
  module Api
    {
      :Base =>              'base',
      :Currency =>            'currency',
      :Market =>              'market',
      :Order =>               'order',
      :Wallet =>              'wallet'      
    }.each_pair do |klass, file| 
      autoload klass, "coinfresh/api/#{file}"
    end

  end

end