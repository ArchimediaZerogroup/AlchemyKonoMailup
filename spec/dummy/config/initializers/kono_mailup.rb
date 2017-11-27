# Utilizza questo file per configurare l'engine
KonoMailup.setup do |config|

  ##
  # MAILUP_CLIENT_ID
  config.mailup_client_id = Rails.application.secrets.kono_mailup[:mailup_client_id]

  ##
  # MAILUP_CLIENT_SECRET
  config.mailup_client_secret = Rails.application.secrets.kono_mailup[:mailup_client_secret]


end