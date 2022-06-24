class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  def price
    _recipe_foods = recipe_foods.includes(:food)
    _recipe_foods = recipe_foods.joins(:food).select('recipe_foods.*, foods.name as name, foods.price as price')
    recipe_foods_price = 0
    _recipe_foods.each do |food|
      recipe_foods_price += (food.price * food.quantity)
    end
    recipe_foods_price
  end
end
