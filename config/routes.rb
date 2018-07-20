Rails.application.routes.draw do
  
  root 'static#home'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'

  resources :users
  resources :pledges, except: :index
  resources :funding_projects

  resources :users do
    resources :addresses, only: [:new, :show, :edit]
  end

  resources :users do
    resources :comments
  end

  resources :funding_projects do
    resources :comments, only: [:index, :new, :show]
  end
end
