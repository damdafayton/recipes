class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = @user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @user = current_user
    @recipe = @user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe created successfully!'
    else
      render new, status: :unprocessable_entity
    end
  end

  def delete
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to recipes_path, notice: 'Deleted Successfully'
    else
      redirect_to root, notice: 'Not deleted'
    end
  end

  def public_recipes
    @public_recipes = Recipe.includes(:user).all.where(public: true).order(created_at: :desc)
    render :public_recipes
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
