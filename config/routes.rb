Rails.application.routes.draw do
  get 'news_feed/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'posts'

  devise_for :users do
    resources :albums
  end
  
  resources :posts

  root to: 'posts#index'

end
