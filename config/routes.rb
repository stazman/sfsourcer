Rails.application.routes.draw do
  
  get 'fave_genres/index'
  get 'fave_genres/new'
  get 'fave_genres/show'
  get 'fave_genres/edit'
  get 'fave_lits/index'
  get 'fave_lits/new'
  get 'fave_lits/show'
  get 'fave_lits/edit'
  get 'fave_authors/index'
  get 'fave_authors/new'
  get 'fave_authors/show'
  get 'fave_authors/edit'
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
  resources :fp_categories
  resources :fp_comments
  resources :funding_projects
  # resources :l_story_ls_genres
  resources :l_stories
  resources :ls_comments
  resources :ls_genres
  resources :pledges
  resources :users
  
  resources :users do
    resources :funding_projects, except: [:index]
  end
  
  resources :l_stories do
  #  only: [:new, :create, :show] do
    resources :ls_genres
    # , only: [:new, :create, :show]
  end
 
  resources :users do
    resources :addresses
    # , only: [:new, :show, :edit]
  end

  resources :funding_projects do
    resources :funding_categories
    # , only: [:index, :show]
  end

  # resources :fp_creators do
  #   resources :funding_projects
  # end  
  
  # resources :funding_projects do
  #   resources :fp_comments
  # end

  # resources :funding_categories do
  #   resources :
  # resources :users do
  #   resources :fp_comments
  # end

end
