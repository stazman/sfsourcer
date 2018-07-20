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
    resources :addresses
  end

  
  # get 'addresses/index'
  # get 'addresses/new'
  # get 'addresses/create'
  # get 'addresses/show'
  # get 'addresses/edit'
  # get 'addresses/update'
  # get 'addresses/destroy'

  # resources :funding_projects do 
  #   resources :comments
  # end

  #can only destroy a funding project as admin

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
