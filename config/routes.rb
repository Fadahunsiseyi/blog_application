# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
    end

    
   resources :posts do
    resources :comments
    resources :likes
   end

    root to: 'users#index'

end
