Rails.application.routes.draw do

  root 'application#welcome'
  get '/musicians' => 'musicians#index'
  post '/bands/addmember' => 'bands#addmember'
  resources :musicians, only: [:new, :create, :show]
  resources :bands

end
