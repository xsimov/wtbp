Rails.application.routes.draw do

  root 'application#welcome'
  resources :musicians, only: [:new, :index, :create, :show]
  resources :bands do
    resources :concerts, only: [:create, :show]
  end
  get '/concerts' => 'concerts#index'
  post '/search' => 'search#allfields'
# API points for the JS

  post '/bands/addmember' => 'bands#addmember'
  get '/bands/:id/members' => 'bands#members'

end