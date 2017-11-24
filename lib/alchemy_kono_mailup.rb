require "alchemy_kono_mailup/engine"

module AlchemyKonoMailup

  extend ActiveSupport::Autoload

  autoload :Engine

  eager_autoload do

  end


  # Default way to setup AlchemyKonoMailup. Run "rails generate tikal_dish_core_install" to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end

end
