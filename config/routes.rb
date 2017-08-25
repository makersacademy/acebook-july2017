Rails.application.routes.draw do


  devise_for :users

  resources :users do
    resources :wall
    resources :news_feed
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
