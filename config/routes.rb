Chuych::Application.routes.draw do
  
  resources :churches,  only: [:index, :create, :new, :show]
  resources :posts, only: [:index, :edit, :show, :new, :create]

  resources :welcome, only: [:index, :new] 


  root :to => 'welcome#new'

  get "church/show"
  get "church/edit"
  get "church/new"

  devise_for :users
  

end
