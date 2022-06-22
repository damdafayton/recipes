class RecipesController < ApplicationController
  def index; end

  def show; end

  def public_recipes
    @public_recipes = Recipe.includes(:user, :recipe_foods).all.where(public: true).order(created_at: :desc)
    p "price = ", @public_recipes[1].price, " end "
    render :public_recipes
  end
end
