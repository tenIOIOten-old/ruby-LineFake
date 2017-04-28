Rails.application.routes.draw do
  get 'groups/index'

  get 'groups/create'

  get 'groups/destroy'

  get 'groups/edit'

  get 'groups/show'

  get 'favorites/create'

  get 'favorites/destroy'

  get 'relationships/create'

  get 'relationships/destroy'

  root 'static_pages#home'

  get '/help', to: "static_pages#help"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  resources :users
  resources :groups 
  resources :microposts, only: [ :create, :destroy ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
