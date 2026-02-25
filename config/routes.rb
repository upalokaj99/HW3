Rails.application.routes.draw do
  root "places#index"

  resources :places, only: [:index, :show, :new, :create]
  resources :entries, only: [:new, :create]
end
