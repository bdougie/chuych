Chuych::Application.routes.draw do
  
  resources :churches,  only: [:index, :create, :new, :show]
  resources :posts, only: [:index, :edit, :show, :new]

  resources :welcome, only: [:index] do
  	resources :posts, only: [:index]
  end


  root :to => 'welcome#index'

  get "church/show"
  get "church/edit"
  get "church/new"

  devise_for :users
  

end
