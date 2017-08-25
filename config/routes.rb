Rails.application.routes.draw do

  get 'news_feed/index'
  devise_for :users

  resources :users do
    resources :albums do
      resources :images
    end
  end

  resources :posts do
    resources :comments
    resources :likes
  end

  root to: 'posts#index'
end
