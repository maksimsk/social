Rails.application.routes.draw do
  get 'users/show'
  resources :publics do
    resources :posts
    resources :public_users
  end
  resources :posts do
    resources :likes
    resources :dislikes
    resources :comments
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, :only => [:show]

  root to: 'dashboard#index'
end
