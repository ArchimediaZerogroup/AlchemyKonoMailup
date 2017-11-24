$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "alchemy_kono_mailup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "alchemy_kono_mailup"
  s.version     = AlchemyKonoMailup::VERSION
  s.authors     = ["Marino Bonetti"]
  s.email       = ["marinobonetti@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of AlchemyKonoMailup."
  s.description = "TODO: Description of AlchemyKonoMailup."
  s.license     = "MIT"

  files = `git ls-files -z`.split("\x0")

  s.files = files.grep(%r{^(app|config|db|lib)/}) + %w(MIT-LICENSE Rakefile README.rdoc)
  s.test_files = files.grep(%r{^(spec)/})


  s.add_dependency "rails", "~> 4.2.10"


  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails', '~> 3.0'
  s.add_development_dependency 'factory_girl_rails', '~> 4.5'
  s.add_development_dependency 'better_errors', '~> 2.1.1'
  s.add_development_dependency 'thin', '~> 1.6.3'
  s.add_development_dependency 'alchemy_cms', '~> 4.0'


end
