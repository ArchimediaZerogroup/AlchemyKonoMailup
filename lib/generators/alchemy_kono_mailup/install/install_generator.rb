module AlchemyKonoMailup
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc "Creates Initializers"
      def copy_initializer

        route 'mount AlchemyKonoMailup::Engine => "/"'

        generate 'kono_mailup:install --disable_routes'

      end


    end
  end
end
