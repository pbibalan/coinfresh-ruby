# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coinfresh/version'

Gem::Specification.new do |spec|
  spec.name          = "coinfresh"
  spec.version       = Coinfresh::VERSION
  spec.authors       = ["Pouyan T. Bibalan", "Ricky Gu"]
  spec.email         = ["pouyan@coinfresh.com"]
  spec.description   = %q{CoinFresh API Client}
  spec.summary       = %q{A ruby wrapper library to interact with CoinFresh API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"  
  spec.add_development_dependency "vcr"
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'api-auth'
end