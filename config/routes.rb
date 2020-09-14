Rails.application.routes.draw do
  root to: 'api/v1/urls#index'
  get "/:short", to: "api/v1/urls#show"

  namespace :api do
    namespace :v1 do
      resources :urls, only: :create
    end
  end
end
