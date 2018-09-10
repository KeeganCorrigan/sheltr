Rails.application.routes.draw do
  get "/auth/google_oauth2/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get "/login", to: redirect("/auth/google_oauth2")

  root "welcome#index"
  get "/search", to: "search#index"
  get "/about", to: "about#show"
end
