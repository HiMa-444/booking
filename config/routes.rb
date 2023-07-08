Rails.application.routes.draw do
  get 'result', to: 'sarchs#index'
  get 'sarch', to: 'sarchs#new'
  post 'sarch', to: 'sarchs#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users do
    member do
      get 'account_edit', to: 'users#account_edit'
      patch 'account_update', to: 'users#account_update'
    end
  end
  get 'top', to: 'users#top'
  patch '/users/:id', to: 'users#update'
  resources :rooms
  resources :reservations do
    member do
    get 'new'
    get 'check', to: 'reservations#check'
    end
  end
  root to: "users#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
