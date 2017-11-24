module AlchemyKonoMailup
  class Engine < ::Rails::Engine
    isolate_namespace AlchemyKonoMailup

    require 'alchemy_kono_mailup'
    require 'alchemy_cms'


    config.eager_load_namespaces << AlchemyKonoMailup

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    initializer 'alchemy_kono_mailup.add_locales' do |app|
      I18n.load_path += Dir[::AlchemyKonoMailup::Engine.root.join('config', 'locales', '**', '*.{rb,yml}')]
    end


  end
end
