RailsBlog::Application.routes.draw do

  root 'posts#index'
  delete 'logout' => 'sessions#destroy'
  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#destroy'

  resources :sessions
  resources :users, :only => [:new, :show, :index]
  resources :tags, :only => [:show, :index]

  resources :posts do
    resources :comments, :only => [:new, :create]
  end
end
