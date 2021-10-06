# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :events
  root 'users#index'
end
