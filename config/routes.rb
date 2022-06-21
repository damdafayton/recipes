# frozen_string_literal: true

Rails.application.routes.draw do
  get 'recipies/index'
  get 'recipies/show'

  resources :recipies, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
