Rails.application.routes.draw do
  
  get 'ls_comments/index'
  get 'ls_comments/new'
  get 'ls_comments/show'
  get 'ls_comments/edit'
  # get 'l_stories/index'
  # get 'l_stories/new'
  # get 'l_stories/show'
  # get 'l_stories/edit'
  # get 'o_genres/index'
  # get 'o_genres/new'
  # get 'o_genres/show'
  # get 'o_genres/edit'
  root 'static#home'

  get 'sourcer_projects', to: 'static#sourcer_projects'
  get 'living_stories', to: 'static#living_stories'


  
  namespace :admin do
    resources :funding_categories, only: [:new, :create, :edit, :update, :destroy]
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'

  resources :addresses
  resources :comments
  resources :funding_categories
  resources :funding_project_categories
  resources :funding_projects
  # resources :l_story_o_genres
 
  resources :pledges
  resources :users
  
  resources :l_stories do
  #  only: [:new, :create, :show] do
    resources :o_genres
    # , only: [:new, :create, :show]
  end
 
  resources :l_stories
  resources :o_genres
  
  resources :users do
    resources :addresses, only: [:new, :show, :edit]
  end

  resources :funding_projects do
    resources :funding_categories, only: [:index, :show]
  end

  # resources :fp_creators do
  #   resources :funding_projects
  # end  
  
  # resources :funding_projects do
  #   resources :comments
  # end

  # resources :funding_categories do
  #   resources :
  # resources :users do
  #   resources :comments
  # end

end
