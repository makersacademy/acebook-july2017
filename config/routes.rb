Rails.application.routes.draw do

  get 'news_feed/index'
  devise_for :users
  resources :posts
  resources :users
  root to: 'posts#index'

end
