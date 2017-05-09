Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#new"
  get '/auth/github/callback', to: "sessions#create"
  get '/signout', to: "sessions#destroy", as: :signout

end
