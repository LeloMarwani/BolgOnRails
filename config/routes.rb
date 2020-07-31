Rails.application.routes.draw do

  devise_for :users do
    resources :posts 
        resources :comments
      end
      root 'posts#index'
    end
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
    end
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



