Rails.application.routes.draw do
  root 'instruments#index'
  
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  resources :instruments
end
