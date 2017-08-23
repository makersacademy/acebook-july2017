Rails.application.routes.draw do
  get 'users/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'posts'
  devise_for :users
  resources :posts
  resources :users 
  root to: 'posts#index'

end
