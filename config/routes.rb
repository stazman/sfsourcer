Rails.application.routes.draw do
  
  root 'static#home'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get 'auth/facebook/callback' => 'sessions#create'
  get 'auth/failure' => 'static#home'
  get '/logout' => 'sessions#destroy'
 
  get '/funding_projects/:id/description' => 'funding_projects#description'
  get '/funding_projects/:id/body' => 'funding_projects#body'
  get '/funding_projects/all_funding_projects' => 'funding_projects#all_funding_projects'

  get '/writer_groups_home' => 'static#writer_groups_home'
  
  get '/all_sf_fanvorites' => 'static#all_sf_fanvorites'
  get '/sf_lit_fanvorites' => 'static#sf_lit_fanvorites'
  get '/lit_fan_authors/alphabetized' => 'lit_fan_authors#alphabetized'

  get "/l_stories/all_living_stories" => "l_stories#all_living_stories"
  patch "l_stories/:id/edit" => "l_stories#update"

  get '/about' => 'static#about'
  get '/contact' => 'static#contact'
  get '/terms_and_conditions' => 'static#terms_and_conditions'

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