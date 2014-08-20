Rails.application.routes.draw do

  root 'application#welcome'

  resources :musicians, only: [:new, :create, :show]
  resources :bands

end
