Chuych::Application.routes.draw do
  
  resources :churches,  only: [:index, :create, :new, :show]
  resources :posts, only: [:index, :edit, :new, :show]

  root :to => 'welcome#index'

  get "church/show"
  get "church/edit"
  get "church/new"

  devise_for :users
  

end
