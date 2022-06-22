class User < ApplicationRecord
  has_many :recipes

  def required_foods_data
    (_required_foods_list, _required_foods_in_recipes) = required_foods_in_recipes
    _required_foods_in_inventory = {}
    inventory = Inventory.where(user_id: id)[0]
    _required_foods_list.each do |food_id, _data|
      user_inventory_food = InventoryFood.where(inventory_id: inventory.id, food_id:)[0]
      _required_foods_in_inventory[food_id] = (user_inventory_food&.quantity || 0)
    end

    _cost_of_missing_foods_in_recipes = {}
    _required_foods_in_recipes.each do |recipe_id, foods|
      cost_of_missing_foods = 0
      foods.each do |food_id, quantity|
        cost_of_this_food = [quantity - _required_foods_in_inventory[food_id],
                             0].max * _required_foods_list[food_id].price
        cost_of_missing_foods += cost_of_this_food
      end
      _cost_of_missing_foods_in_recipes[recipe_id] = cost_of_missing_foods
    end

    [_required_foods_list, _required_foods_in_recipes, _required_foods_in_inventory,
     _cost_of_missing_foods_in_recipes]
  end

  private

  def required_foods_in_recipes
    _required_foods_in_recipes = {}
    _required_foods_list = {}
    recipes.each do |recipe|
      recipe_foods = RecipeFood.where(recipe_id: recipe.id)
      _required_foods_in_recipes[recipe.id] = {}

      recipe_foods.each do |rf|
        _required_foods_list[rf.food_id] = Food.find(rf.food_id)
        _required_foods_in_recipes[recipe.id][rf.food_id] = rf.quantity
      end
    end
    [_required_foods_list, _required_foods_in_recipes]
  end
end
