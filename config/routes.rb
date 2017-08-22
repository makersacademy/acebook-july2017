Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'posts'

  devise_for :users
  resources :posts

  root to: 'posts#index'

end
