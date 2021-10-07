# frozen_string_literal: true

Rails.application.routes.draw do
  get 'events/index'
  get 'events/show'
  devise_for :users
  resources :users
  resources :events
  resources :attendances
  resources :attendances do
    match '/join', to: 'attendances#join', via: :post, on: :collection
  end
  root 'users#index'
end
