Chuych::Application.routes.draw do
  
  resources :church,  only: [:index]

  root :to => 'welcome#index'

  get "church/show"
  get "church/edit"
  get "church/new"

end
