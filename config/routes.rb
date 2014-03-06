Chuych::Application.routes.draw do
  
  resources :churches,  only: [:index, :create, :new, :show] do
    resources :favorites, only: [:create, :destroy]
  end
  
  resources :posts, only: [:index, :edit, :show, :new, :create, :edit]

  resources :welcome, only: [:index, :new] 


  root :to => 'welcome#index'

  get "church/show"
  get "church/edit"
  get "church/new"

  # devise_for :users, controllers: {omniauth_callbacks:'users/omniauth_callbacks'}
  # added the below for twitter
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "users/omniauth_callbacks", registrations: 'users/registrations'}
  resources :users, only: [:show]
end
