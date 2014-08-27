Rails.application.routes.draw do

  root 'application#welcome'
  resources :musicians, only: [:new, :index, :create, :show]
  resources :bands do
    resources :concerts, only: [:create, :show]
  end
  resources :sessions, only: :create

  get '/concerts' => 'concerts#index'
  post '/search' => 'search#allfields'
  post '/search/bands' => 'search#bands'
  post '/search/musicians' => 'search#musicians'

# API points for the JS

  post '/bands/addmember' => 'bands#addmember'
  get '/bands/:id/members' => 'bands#members'

end