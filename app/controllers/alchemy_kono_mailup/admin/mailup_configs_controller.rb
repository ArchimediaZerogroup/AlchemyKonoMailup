module AlchemyKonoMailup::Admin
  class MailupConfigsController < BaseController


    def main
      authorize! :main, :alchemy_kono_mailup_admin_mailup_configs



    end

  end
end