class FoodsController < ApplicationController
  def index 
    @foods = Food.all
  end

  def new 
    pass
  end
end