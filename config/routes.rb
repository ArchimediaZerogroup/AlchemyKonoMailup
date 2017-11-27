AlchemyKonoMailup::Engine.routes.draw do


  namespace :admin, { path: Alchemy.admin_path, constraints: Alchemy.admin_constraints } do
    resources :mailup_configs, only: [:main] do
      collection do
        get :main
      end
    end

    mount KonoMailup::Engine => "/kono_mailup"

  end

  get '/auth/mailup/callback', to: 'admin/tokens#create'



  mount Alchemy::Engine => '/'

end
