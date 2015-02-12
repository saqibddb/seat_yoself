Rails.application.routes.draw do

	root 'restaurants#index'

  resources :restaurants, only: [:index, :show] do
    resources :reservations
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  # namespace :admin do
  #   resources :restaurants, :reservations
  # end
end
