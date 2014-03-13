Chuych::Application.routes.draw do
  
  resources :churches,  only: [:index, :create, :new, :show] do
    resources :favorites, only: [:create, :destroy]
    #nest post here so they are associated to a church. this way individuals can really promote a church.
  end
  
  resources :posts, only: [:index, :edit, :show, :new, :create, :edit]

  #  resources :church do
#     resources :favorites, only: [:create, :destroy]

  #   resources :posts, except: [:index] , controller: 'churches/posts' do # look this up from bloccit
  #     resources :comments, only: [:create, :destroy]
  #     match '/up-vote', to: 'votes#up_vote', as: :up_vote # havent implemented voting yet.
  #     match '/down-vote', to: 'votes#down_vote', as: :down_vote
  #   end
  # end

  resources :welcome, only: [:index, :new] 


  root :to => 'welcome#new'

  # get "church/show"
  # get "church/edit"
  # get "church/new"


  # devise_for :users, controllers: {omniauth_callbacks:'users/omniauth_callbacks'}
  # added the below for twitter
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "users/omniauth_callbacks", registrations: 'users/registrations'}
  resources :users, only: [:show]
  # resources :posts, only: [:index] add only after implement nesting

end
