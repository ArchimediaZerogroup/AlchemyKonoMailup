Rails.application.routes.draw do

  mount AlchemyKonoMailup::Engine => "/"
  mount Alchemy::Engine => '/'

end
