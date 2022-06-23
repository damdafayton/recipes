Rails.application.routes.draw do
  root 'recipes#index'
  get 'public_recipes', to: 'recipes#public_recipes', as: 'public_recipes_action'
  
  resources :recipes, only: [:index, :show, :create, :new]
  resources :foods, only: [:index, :show, :create, :new]
  
  get 'general_shopping_list', to: 'users#general_shopping_list', as: 'general_shopping_list_action'

end
