Rails.application.routes.draw do
  get 'inventory_foods/create'
  devise_for :users
  get 'recipe_food/index'
  get 'recipe_food/show'
  root 'recipes#public_recipes'
  get 'public_recipes', to: 'recipes#public_recipes', as: 'public_recipes_action'
  
  resources :recipes, only: [:index, :show, :new, :create] do 
    member do
      get :delete
    end
  end
  resources :foods, only: [:index, :show, :create, :new]
  resources :inventory_foods, only: [:index, :create, :new]
  resources :foods, only: [:index, :show, :create, :new, :destroy]
  
  get 'general_shopping_list', to: 'users#general_shopping_list', as: 'general_shopping_list_action'

end
