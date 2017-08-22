Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'posts'

  devise_for :users
  resources :posts

<<<<<<< HEAD
  root to: 'posts#index'
=======
  root 'posts#index'
>>>>>>> cb73a0af60f5d839f6dad7776edcbe1c638e2412

end
