Rails.application.routes.draw do
  require_relative 'config/environment'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  devise_for :users
    resources :posts do
        resources :comments
      end
      root 'posts#index'

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
    end


