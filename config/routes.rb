Rails.application.routes.draw do

  root 'application#welcome'
  resources :musicians, only: [:new, :create, :show]
  resources :bands do
    resources :concerts, only: [:create, :show]
  end

# API points for the JS

  get '/musicians' => 'musicians#index'
  post '/bands/addmember' => 'bands#addmember'
  get '/bands/:id/members' => 'bands#members'

end