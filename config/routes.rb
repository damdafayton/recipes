# frozen_string_literal: true

Rails.application.routes.draw do
  root 'recipes#public_recipes'
  get 'public_recipes', to: 'recipes#public_recipes', as: 'public_recipes_action'
  
  resources :recipes, only: [:index, :show]
  resources :foods, only: [:index, :show, :create, :new]
  
  get 'general_shopping_list', to: 'user#general_shopping_list', as: 'shopping_list_action'

end
