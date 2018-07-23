Rails.application.routes.draw do
  
  root 'static#home'
  
  namespace :admin do
    resources :funding_categories, only: [:new, :create, :edit, :update, :destroy]
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'

  resources :users
  resources :pledges, except: :index
  resources :funding_projects
  resources :comments
  

  resources :users do
    resources :addresses, only: [:new, :show, :edit]
  end

  resources :funding_projects do
    resources :funding_categories, only: [:index, :show]
  end

  # resources :funding_categories do
  #   resources :
  # resources :users do
  #   resources :comments
  # end

  # resources :funding_projects do
  #   resources :comments
  # end
end
