class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: :public_recipes

  def index
    @user = current_user
    @recipes = @user&.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    data = Recipe.where(id: params[:id])
    @recipe = data[0]
    @inventory_foods = Food.all.joins('INNER JOIN recipe_foods ON foods.id = recipe_foods.food_id')
      .order(created_at: :desc).select('foods.*, recipe_foods.quantity, recipe_foods.id as recipe_foods_id')
      .where(recipe_foods: { recipe_id: params[:id] })
    return unless current_user

    @inventory_hash = Inventory.all.where(user_id: current_user.id).map { |inventory| [inventory.name, inventory.id] }
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
    @public_recipes = Recipe.includes(:user, :recipe_foods).all.where(public: true).order(created_at: :desc)
    render :public_recipes
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
