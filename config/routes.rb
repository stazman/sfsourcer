Rails.application.routes.draw do
  

  get 'fp_creators/index'
  get 'fp_creators/new'
  get 'fp_creators/show'
  get 'fp_creators/edit'
  get 'fp_creators/name'
  root 'static#home'

  # namespace :admin do
  #   resources :funding_categories, only: [:new, :create, :edit, :update, :destroy]
  # end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'

  get '/all_sf_fanvorites', to: 'static#all_sf_fanvorites'
  get '/sf_lit_fanvorites', to: 'static#sf_lit_fanvorites'
  get '/sf_film_fanvorites', to: 'static#sf_film_fanvorites'
  get '/sf_game_fanvorites', to: 'static#sf_game_fanvorites'
  get '/sourcer_projects', to: 'static#sourcer_projects'


  
  resources :pledges
  resources :users
  resources :sf_favs
  resources :lit_fan_genres
  resources :lit_fan_works
  resources :funding_projects
  # resources :addresses
  # resources :fp_categories
  # resources :fp_comments
  # resources :l_stories
  # resources :ls_comments
  # resources :ls_genres

  resources :users do
    resources :sf_favs, only: [:new, :show, :edit]
  end

  resources :lit_fan_authors do
    resources :lit_fan_works, only: [:index, :new, :show, :edit]
  # why not create and update, too?
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

