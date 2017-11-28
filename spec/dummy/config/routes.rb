Rails.application.routes.draw do

  resources :mailup_subscription_forms


  mount AlchemyKonoMailup::Engine => "/"
  mount Alchemy::Engine => '/'

end
