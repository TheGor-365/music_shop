Rails.application.routes.draw do
  root 'instruments#index'
  
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  resources :line_items
  resources :carts
  resources :instruments
end
