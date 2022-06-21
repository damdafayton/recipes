class RecipesController < ApplicationController
  def index; end

  def show; end

  def public_recipes
    @public_recipes = Recipe.includes(:user).all.where(public: true).order(created_at: :desc)
    render :public_recipes
  end
end
