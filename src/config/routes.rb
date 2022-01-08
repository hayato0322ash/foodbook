Rails.application.routes.draw do
  get 'user_favorites/show'
  get 'likes/create'
  get 'likes/destroy'
  root to: 'sessions#new'
  resources :users do
    collection do
      get 'search'
    end
    resources :favorites, only: [:index]
  end
  resources :shops do
    collection do
      get 'search'
    end
  end
  resources :menus do
    collection do
      get 'search'
    end
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
    resources :favorites, only: %i[create destroy]
  end

  resources :comments do
    resources :replies, only: %i[create destroy]
  end

  controller :sessions do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
end
