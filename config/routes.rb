Rails.application.routes.draw do
  
  root 'static#home'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'

  get '/all_sf_fanvorites', to: 'static#all_sf_fanvorites'
  get '/sf_lit_fanvorites', to: 'static#sf_lit_fanvorites'
  get '/sf_film_fanvorites', to: 'static#sf_film_fanvorites'
  get '/sf_game_fanvorites', to: 'static#sf_game_fanvorites'
  get '/sourcer_projects', to: 'static#sourcer_projects'

  get '/lit_fan_authors/alphabetized', to: 'lit_fan_authors#alphabetized'

  resources :users
  # resources :funding_projects
  # resources :fp_creators
  # resources :pledges
  # resources :fp_backers
  # resources :sf_favs
  resources :lit_fan_genres
  resources :lit_fan_works
  resources :lit_fan_authors

  # resources :users do
  #   resources :sf_favs, only: [:new, :show, :edit]
  # end

  resources :lit_fan_authors do
    resources :lit_fan_works, only: [:index, :new, :show, :edit]
  # why not create and update, too?
  end
end