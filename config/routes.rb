Rails.application.routes.draw do
  
  get 'writer_groups/index'
  get 'writer_groups/new'
  get 'writer_groups/create'
  get 'writer_groups/show'
  get 'writer_groups/edit'
  get 'writer_groups/update'
  get 'writer_groups/destroy'
  root 'static#home'
  
  get '/about', to: 'static#about'
  get '/contact', to: 'static#contact'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: 'static#home'
  get '/logout', to: 'sessions#destroy'
 
  get '/all_sf_fanvorites', to: 'static#all_sf_fanvorites'
  get '/sf_lit_fanvorites', to: 'static#sf_lit_fanvorites'
  get '/lit_fan_authors/alphabetized', to: 'lit_fan_authors#alphabetized'

  get 'all_sf_events', to: 'static#all_sf_events'
  
  get '/funding_projects/:id/description', to: 'funding_projects#description'

  get '/funding_projects/:id/body', to: 'funding_projects#body'

  resources :users
  resources :sessions
  resources :lit_fan_genres
  resources :lit_fan_works
  resources :lit_fan_authors
  resources :l_stories
  resources :ls_comments
  resources :ls_users
  resources :funding_projects
  resources :pledges
  resources :writer_groups
  
  resources :lit_fan_authors do
    resources :lit_fan_works, only: [:index, :new, :show, :edit]
  end

  resources :funding_projects do
    resources :pledges
  end
end