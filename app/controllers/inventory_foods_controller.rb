class InventoryFoodsController < ApplicationController
  def index
    @inventory_foods = InventoryFood.all
    @recipe = Recipe.where(id: params[:id])
  end

  def new
    @inventory_food = InventoryFood.new
    @inventory_food_ids = InventoryFood.all.where(inventory_id: params[:inventory_id]).pluck(:food_id)
    @foods = Food.all.where(user_id: current_user.id).where.not(id: @inventory_food_ids)

    @inventory_ids = InventoryFood.all.where(inventory_id: params[:inventory_id]).pluck(:inventory_id)
    @inventory = Inventory.all.where(user_id: current_user.id).where.not(id: @inventory_food_ids)
    @inventories = Inventory.where(inventory_id: params[:inventory_id])
  end

  def create
    @inventory_foods = InventoryFood.new(inventory_foods_params)
    @inventory_ids = InventoryFood.all.where(inventory_id: params[:inventory_id]).pluck(:inventory_id)
    @inventory = Inventory.all.where(user_id: current_user.id).where.not(id: @inventory_food_ids)
    @inventories = Inventory.where(inventory_id: params[:inventory_id])
    @inventory_foods.inventory_id = params[:inventory_id]

    @inventory_food_ids = InventoryFood.all.where(inventory_id: params[:inventory_id]).pluck(:food_id)
    @foods = Food.all.where(user_id: current_user.id).where.not(id: @inventory_food_ids)
    if @inventory_foods.save
      redirect_to root_path, notice: 'Ingredient successfully added'
    else
      render :new, alert: 'Ingredient could not be created'
    end
  end

  private

  def inventory_foods_params
    params.permit(:food_id, :quantity, :inventory_id)
  end
end
