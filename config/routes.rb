Rails.application.routes.draw do
  
  root 'static#home'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: 'static#home'
  get '/logout', to: 'sessions#destroy'
 
  get '/funding_projects/:id/description', to: 'funding_projects#description'
  get '/funding_projects/:id/body', to: 'funding_projects#body'

  get '/writer_groups_home', to: 'static#writer_groups_home'
  
  get '/all_sf_fanvorites', to: 'static#all_sf_fanvorites'
  get '/sf_lit_fanvorites', to: 'static#sf_lit_fanvorites'
  get '/lit_fan_authors/alphabetized', to: 'lit_fan_authors#alphabetized'

  get "/l_stories/all_living_stories" => "l_stories#all_living_stories"
  patch "l_stories/:id/edit" => "l_stories#update"

  get '/about', to: 'static#about'
  get '/contact', to: 'static#contact'
  get '/terms_and_conditions', to: 'static#terms_and_conditions'

  resources :users
  resources :sessions

  resources :funding_projects
  resources :pledges
 
  resources :lit_fan_genres
  resources :lit_fan_works
  resources :lit_fan_authors

  resources :l_stories
  resources :ls_comments
  resources :ls_users

  resources :writer_groups
  resources :wg_works
  resources :wg_comments

  resources :events
  
  
  resources :funding_projects do
    resources :pledges
  end

  resources :writer_groups do
    resources :wg_works
  end
  
  resources :wg_works do
    resources :wg_comments
  end

  resources :lit_fan_authors do
    resources :lit_fan_works, only: [:index, :new, :show, :edit]
  end

end