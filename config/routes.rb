Chuych::Application.routes.draw do
  
  devise_for :users
  resources :churches,  only: [:index, :create, :new, :show]

  root :to => 'welcome#index'

  get "church/show"
  get "church/edit"
  get "church/new"

end
