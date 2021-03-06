Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: "sessions#create"
  get '/auth/failure', to: redirect('/')
  get '/signout', to: "sessions#destroy", as: :signout

  get '/user', to: "users#show"
  get '/user/repos', to: "repos#index" #/repos/user?

end
