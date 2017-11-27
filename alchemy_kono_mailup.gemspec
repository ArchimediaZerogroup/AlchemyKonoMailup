$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "alchemy_kono_mailup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "alchemy_kono_mailup"
  s.version = AlchemyKonoMailup::VERSION
  s.authors = ["Marino Bonetti"]
  s.email = ["marinobonetti@gmail.com"]
  s.homepage = "https://github.com/ArchimediaZerogroup/AlchemyKonoMailup"
  s.summary = "AlchemyKonoMailup"
  s.description = "Plugin to integrate mailup into Alchemy"
  s.license = "MIT"

  files = `git ls-files -z`.split("\x0")

  s.files = files.grep(%r{^(app|config|db|lib)/}) + %w(MIT-LICENSE Rakefile README.rdoc)
  s.test_files = files.grep(%r{^(spec)/})


  s.add_runtime_dependency 'alchemy_cms', [">= 4.0.0.beta", "< 4.99"]
  s.add_runtime_dependency "kono_mailup", [">= 0.0.2", "< 2"]


  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'better_errors'
  s.add_development_dependency 'thin'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'alchemy-devise'


end
