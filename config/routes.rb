Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :comments, only: [:create]
    end
  end

  get 'messages/reply'

  get "/auth/google_oauth2/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get "/login", to: redirect("/auth/google_oauth2")

  root "welcome#index"
  get "/search", to: "search#index"
  get "/about", to: "about#show"

  resource :translate, only: [:update]

  resource :messages do
    collection do
      post 'reply'
    end
  end
end
