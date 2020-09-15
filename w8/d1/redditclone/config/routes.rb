Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  # resources :users, only: [:show, :new, :create]
  # P2
  resources :subs, except: [:destroy]
  resources :posts, except: [:destroy, :index]
  # i.e. for destroy, require sign in
  # but if post doesn't belong to me, doesn't get deleted
  #? /subs/67/post/87... @post = current_user....find(87)
  #? if i don't own 87, comes at as nil... can't destroy
  # root to: redirect('/subs')
end
