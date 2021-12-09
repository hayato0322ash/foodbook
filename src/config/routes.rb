Rails.application.routes.draw do
  root to: 'users#new'
  resources :users
  resources :shops
  resources :menus do
    resources :comments, only: :create
  end
  resources :menus do
    resources :comments do
      resources :replies, only: :create
    end
  end
end
