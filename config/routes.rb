Rails.application.routes.draw do
  
  root 'static#home'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: 'static#home'
  get '/logout', to: 'sessions#destroy'
 
  get '/all_sf_fanvorites', to: 'static#all_sf_fanvorites'
  get '/sf_lit_fanvorites', to: 'static#sf_lit_fanvorites'
  get '/lit_fan_authors/alphabetized', to: 'lit_fan_authors#alphabetized'

  resources :users
  resources :sessions
  resources :lit_fan_genres
  resources :lit_fan_works
  resources :lit_fan_authors

  resources :lit_fan_authors do
    resources :lit_fan_works, only: [:index, :new, :show, :edit]
  end
end