Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :dashboard do
    post "login", to: "authentications#authenticate"
    get "me", to: "authentications#current"
    post "refresh", to: "authentications#refresh"
    post "logout", to: "authentications#logout"

    resources :locations, only: [:index, :show, :create, :update, :destroy]
  end

  match "*unmatched", to: "application#route_not_found", via: :all
end
