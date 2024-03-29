# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "stars_bot/version"

Gem::Specification.new do |spec|
  spec.name          = "stars_bot"
  spec.version       = StarsBot::VERSION
  spec.authors       = ["Miguel Michelson"]
  spec.email         = ["miguelmichelson@gmail.com"]

  spec.summary       = "starsconf bot challenge"
  spec.description   = "starsconf bot challenge"
  spec.homepage      = "http://starsconf.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "pry"

  spec.add_dependency "activesupport"
  spec.add_dependency "graphql-client"
  spec.add_dependency "slack-ruby-bot"
  spec.add_dependency "puma"
  spec.add_dependency "sinatra"
  spec.add_dependency "dotenv"
  spec.add_dependency "celluloid-io"
  spec.add_dependency "moneta"
end
