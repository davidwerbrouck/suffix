Suffix::Application.routes.draw do

  resources :sessions, :only => [:new, :create, :destroy]
  resources :posts, :path => 'blog', :only => [:index, :show]
  resources :pages, :only => [:show] # TODO Change routes so that /page-title works

  namespace :admin do
    root :to => 'posts#index'
    resources :posts, :except => [:show]
    resources :pages, :except => [:show]
  end

  match 'login', :to => 'sessions#new'
  match 'logout', :to => 'sessions#destroy'
  root :to => 'posts#index'

end
