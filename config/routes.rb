Rails.application.routes.draw do

  resources :news_feed, only: [:index]
  devise_for :users

  resources :users do
    resources :albums
  end

  resources :posts do
    resources :comments
    resources :likes
  end

  root to: 'posts#index'
end
