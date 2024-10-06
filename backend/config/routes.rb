# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :tasks, only: %i[index edit update create destroy] do
    post :toggle, on: :member
  end
  post 'subscribe', to: 'subscribe#create'
end
