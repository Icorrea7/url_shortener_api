Rails.application.routes.draw do
  get "/stats", to: 'api/v1/urls#index'
  get "/:short", to: "api/v1/urls#show"

  namespace :api do
    namespace :v1 do
      resources :urls, only: :create
    end
  end
end
