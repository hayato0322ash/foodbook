Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :users
  resources :shops
  resources :menus do
    resources :comments, only: %i[create destroy]
  end
  resources :menus do
    resources :comments do
      resources :replies, only: %i[create destroy]
    end
  end

  controller :sessions do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
end
