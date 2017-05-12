Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: "static_pages#help"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout',  to: 'sessions#destroy'
  get '/signup', to: "users#new"
  resources :users do
    member do
      get 'following','followers'
    end
  end
  resources :relationships,  only: [:create, :destroy]
  resources :groups
  resources :group_contents, only: [ :create, :destroy]
  resources :microposts, only: [:show, :create, :destroy ]
  resources :favorites, only: [:create, :destroy]
  mount Api => '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
