class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new; end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      redirect_to foods_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    new_food = Food.new(foods_params)
    new_food.user_id = current_user.id
    if new_food.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def foods_params
    params.permit(:name, :measurement_unit, :price, :user_id)
  end
end
