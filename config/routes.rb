Rails.application.routes.draw do
  
  get 'lit_fan_genres/index'
  get 'lit_fan_genres/new'
  get 'lit_fan_genres/show'
  get 'lit_fan_genres/edit'
  get 'lit_fan_authors/index'
  get 'lit_fan_authors/new'
  get 'lit_fan_authors/show'
  get 'lit_fan_authors/edit'
  get 'lit_fan_works/index'
  get 'lit_fan_works/new'
  get 'lit_fan_works/show'
  get 'lit_fan_works/edit'
  root 'static#home'

  get 'sourcer_projects', to: 'static#sourcer_projects'
  get 'living_stories', to: 'static#living_stories'
  get 'all_sf_fanvorites', to: 'static#all_sf_fanvorites'
  get 'sf_lit_fanvorites', to: 'static#sf_lit_fanvorites'
  get 'sf_film_fanvorites', to: 'static#sf_film_fanvorites'
  get 'sf_game_fanvorites', to: 'static#sf_game_fanvorites'
  get 'all_fan_pages', to: 'static#all_fan_pages'

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
  resources :l_stories
  resources :ls_comments
  resources :ls_genres
  resources :pledges
  resources :users
  resources :sf_favs

  resources :users do
    resources :sf_favs, only: [:new, :create, :show, :edit, :update]
  end
end




  # resources :funding_projects
  
  # get "/funding_projects", to: "funding_projects#index"
  # post "/funding_projects", to: "funding_projects#create"
  # get "/funding_projects/new", to: "funding_projects#new"
  # get "/funding_projects/:id/edit", to: "funding_projects#edit"
  # get "/funding_projects/:id", to: "funding_projects#show"
  # patch "/funding_projects/:id", to: "funding_projects#update"
  # put "/funding_projects/:id", to: "funding_projects#update"
  # delete "/funding_projects/:id", to: "funding_projects#destroy"



  # resources :users do
  #   resources :addresses, only: [:new, :create, :show, :edit, :update]
  # end

# resources :fp_participant do
  #   resources :funding_projects, only: [:index, :show]
  # end
    
# resources :users do
  #   resources :funding_projects, except: [:index]
  # end
  
  # resources :l_stories do
  # #  only: [:new, :create, :show] do
  #   resources :ls_genres
    # , only: [:new, :create, :show]
  # end
 

  # resources :funding_projects do
  #   resources :funding_categories
    # , only: [:index, :show]
  # end

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

