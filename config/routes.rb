# frozen_string_literal: true

Rails.application.routes.draw do
  get 'events/index'
  get 'events/show'
  devise_for :users
  resources :users
  resources :events
  root 'users#index'
end
