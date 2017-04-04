Rails.application.routes.draw do
  devise_for :users
  resources :movies do
    resources :posts
    member do
      post :favorite
      post :unfavorite
    end
  end

  resources :favorites
  root 'movies#index'
end
