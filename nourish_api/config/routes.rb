
  Rails.application.routes.draw do
    resources :users, only: [:index, :create, :show]
    post 'login', to: 'sessions#create'

    resources :babies
    resources :feeds
    resources :pumps
    resources :bottle_feeds
    resources :achievements
  end

