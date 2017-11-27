require 'alchemy_kono_mailup/ability'

Alchemy::Modules.register_module({
                                   name: 'alchemy_kono_mailup',
                                   engine_name: 'alchemy_kono_mailup',
                                   order: 4, # The position in main navigation, if you have more than 1 module.
                                   navigation: {
                                     name: 'modules.kono_mailup', # The name in the main navigation (translated via I18n).
                                     controller: 'alchemy_kono_mailup/admin/mailup_configs', # The controller that will be used.
                                     action: 'main', # The controller action that will be used.
                                     icon: 'module_icon', # Class of icon that will be rendered as navigation icon.
                                     # sub_navigation: [
                                     #   {
                                     #     name: 'modules.kono_mailup.configuration',       # The name for the subnavigation tab (translated via I18n).
                                     #     controller: '/admin/products',  # Controller that will be used.
                                     #     action: 'index'                 # Controller action that will be used.
                                     #   }
                                     # ]
                                   }
                                 })

# Register the module ability
# Alchemy.register_ability MyModuleAbility
Alchemy.register_ability(AlchemyKonoMailup::Ability)
