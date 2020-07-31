# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
Rails.application.routes.draw do
    resources :users, only: [:new, :create]
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'welcome', to: 'sessions#welcome'
 end
 resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
run Rails.application
