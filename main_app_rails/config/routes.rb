Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :dashboard do
    post "login", to: "authentications#authenticate"
    get "me", to: "authentications#current"
    post "refresh", to: "authentications#refresh"
    post "logout", to: "authentications#logout"
  end
end
