
  Rails.application.routes.draw do
    resources :users, only: [:index, :create, :show]
    post 'login', to: 'sessions#create'

    resources :babies
    resources :feeds
    resources :bottle_feeds
    resources :achievements

    get '/my_babies', to: 'babies#my_babies'
    get '/profile', to: 'users#profile'

    resources :pumps do
      collection do
        get 'by_date' 
      end
    end
  end

