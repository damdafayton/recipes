class FoodsController < ApplicationController
  def index
    @foods = Food.all
    puts @foods
  end

  def new; end

  def create
    new_food = Food.new(create_params)
    if new_food.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def create_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
