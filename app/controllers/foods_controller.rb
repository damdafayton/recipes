class FoodsController < ApplicationController
  def index
    @foods = Food.all
    puts @foods
  end

  def new
    pass
  end
end
