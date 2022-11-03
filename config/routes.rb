# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
    end

    
   resources :posts do
    resources :comments
    resources :likes
   end

    root to: 'users#index'

end
