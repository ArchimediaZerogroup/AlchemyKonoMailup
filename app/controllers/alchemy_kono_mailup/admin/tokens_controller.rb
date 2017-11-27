class AlchemyKonoMailup::Admin::TokensController < ::KonoMailup::TokensController
  authorize_resource :class => AlchemyKonoMailup::Admin::TokensController

  before_action :authorize_create, only: [:create]


  private
  def authorize_create
    authorize! :create, :alchemy_kono_mailup_admin_tokens
  end

  def action_after_create
    redirect_to main_admin_mailup_configs_path, notice: 'Successfully token configuration'
  end

end
