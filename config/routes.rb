Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index, :create, :destroy]
      resources :authors, only: [:index, :create, :destroy]
      resources :channels, only: [:index, :create, :destroy]
    end
  end
end
