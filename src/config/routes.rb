Rails.application.routes.draw do
  root to: 'users#new'
  resources :users
  resources :shops
  resources :menus do
    resources :comments, only: :create
  end
end
