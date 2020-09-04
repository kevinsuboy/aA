Rails.application.routes.draw do
  # get 'comments/create'
  # get 'comments/destroy'
  # get 'comments/index'
  # get 'artworks/index'
  # get 'artworks/show'
  # get 'artworks/create'
  # get 'artworks/update'
  # get 'artworks/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :artworks, only: [:show,:create,:update,:destroy]

  resources :users, only: [:index,:show,:create,:update,:destroy] do
    resources :artworks, only: [:index]
  end


  resources :artwork_shares, only: [:create,:destroy]

  resources :comments, only: [:create,:destroy, :index]




  # get '/users',         to: 'users#index',   as: 'users'
  # get '/users/:id',     to: 'users#show' ,   as: 'user'
  # post '/users',        to: 'users#create'
  # patch '/users/:id',   to: 'users#update'
  # delete '/users/:id',  to: 'users#destroy'
  

end