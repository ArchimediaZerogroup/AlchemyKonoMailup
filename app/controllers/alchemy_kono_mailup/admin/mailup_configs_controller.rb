module AlchemyKonoMailup::Admin
  class MailupConfigsController < BaseController


    def main
      authorize! :main, :alchemy_kono_mailup_admin_mailup_configs

      if KonoMailup::API.client_ready?
        @client = KonoMailup::API.new
      end

    end

  end
end