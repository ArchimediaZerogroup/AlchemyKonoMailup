# Utilizza questo file per configurare l'engine
KonoMailup.setup do |config|

  ##
  # Controller from where the engine inherit
  config.base_controller = Proc.new { AlchemyKonoMailup::Admin::BaseController }


end