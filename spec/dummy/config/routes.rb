Rails.application.routes.draw do

  mount Alchemy::Engine => '/'

  mount AlchemyKonoMailup::Engine => "/alchemy_kono_mailup"
end
