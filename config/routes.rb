Chuych::Application.routes.draw do
  
  resources :church,  only: [:index, :create, :new, :show]

  root :to => 'welcome#index'

  get "church/show"
  get "church/edit"
  get "church/new"

end
