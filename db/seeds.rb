# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: "Kuti",email: 'fake@fake.com', password:'123456')
second_user = User.create(name: "Buno", email: 'fake2@fake.com', password:'123456')
third_user = User.create(name: "Dupo", email: 'fake3@fake.com', password:'123456')

first_food = Food.create(name:"Tomato", measurement_unit:"kg", price: 1.5,user_id: first_user.id)
second_food = Food.create(name:"Potato", measurement_unit:"kg", price: 2.2,user_id: first_user.id)
third_food = Food.create(name:"Cucumber", measurement_unit:"kg", price: 3,user_id: first_user.id)
fourth_food = Food.create(name:"Onion", measurement_unit:"kg", price: 0.5,user_id: first_user.id)

first_recipe = Recipe.create(name: "First recipe", preparation_time: "25 minutes", cooking_time: "1.33 hours", description: "cook it well",public: true,user_id: first_user.id)
second_recipe = Recipe.create(name: "Second recipe", preparation_time: "30 minutes", cooking_time: "1 hour", description: "wash the pepper",public: true,user_id: second_user.id)
third_recipe = Recipe.create(name: "Third recipe", preparation_time: "20 minutes", cooking_time: "45 minutes", description: "slice the onion",public: true,user_id: second_user.id)

first_recipe_food = RecipeFood.create(recipe_id: first_recipe.id, food_id: first_food.id, quantity: 1)
second_recipe_food = RecipeFood.create(recipe_id: first_recipe.id, food_id: second_food.id, quantity: 2)
third_recipe_food = RecipeFood.create(recipe_id: second_recipe.id, food_id: first_food.id, quantity: 1.5)
fourth_recipe_food = RecipeFood.create(recipe_id: second_recipe.id, food_id: third_food.id, quantity: 0.8)
fifth_recipe_food = RecipeFood.create(recipe_id: first_recipe.id, food_id: fourth_food.id, quantity: 0.5)

first_inventory = Inventory.create(name:"Inventroy of Kuti", user_id: first_user.id)
second_inventory = Inventory.create(name:"Inventroy of Buno", user_id: second_user.id)

first_inventory_food = InventoryFood.create(inventory_id: first_inventory.id, food_id:first_food.id, quantity:0.8)
second_inventory_food = InventoryFood.create(inventory_id: first_inventory.id, food_id:second_food.id, quantity:0.2)
third_inventory_food = InventoryFood.create(inventory_id: first_inventory.id, food_id:third_food.id, quantity:0.2)
fourth_inventory_food = InventoryFood.create(inventory_id: first_inventory.id, food_id:fourth_food.id, quantity:0.2)

