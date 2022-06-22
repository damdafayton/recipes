class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  # def show
  #   @recipe = Recipe.find(:params[id])
  # end

  def new; end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path, notice: 'Recipe created successfully!'
    else
      render new, status: :unprocessable_entity
    end
  end

  def public_recipes
    @public_recipes = Recipe.includes(:user).all.where(public: true).order(created_at: :desc)
    render :public_recipes
  end

  private

  def recipe_params
    params.permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
