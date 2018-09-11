Rails.application.routes.draw do
  get 'messages/reply'

  get "/auth/google_oauth2/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get "/login", to: redirect("/auth/google_oauth2")

  root "welcome#index"
  get "/search", to: "search#index"
  get "/about", to: "about#show"


  # Twilio route for reply
  resource :messages do
    collection do
      post 'reply'
    end
  end
end
