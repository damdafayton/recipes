# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: "Kuti")
second_user = User.create(name: "Buno")
third_user = User.create(name: "Dupo")

first_food = Food.create(name:"Tomato", measurement_unit:"kg", price: 1.5, user_id: first_user.id)
second_food = Food.create(name:"Potato", measurement_unit:"kg", price: 2.2, user_id: first_user.id)
third_food = Food.create(name:"Cucumber", measurement_unit:"kg", price: 3, user_id:second_user.id)