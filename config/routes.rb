Rails.application.routes.draw do
  
  root 'static#home'
  
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :pledges
  resources :funding_projects

  # get 'pledges/new'
  # get 'pledges/create'
  # get 'pledges/show'
  # get 'pledges/edit'
  # get 'pledges/update'
  # get 'pledges/destroy'
  # get 'funding_projects/index'
  # get 'funding_projects/new'
  # get 'funding_projects/create'
  # get 'funding_projects/show'
  # get 'funding_projects/edit'
  # get 'funding_projects/update'
  # get 'funding_projects/destroy'
  # get 'users/index'
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'

end
