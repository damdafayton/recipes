class FoodsController < ApplicationController
  def index
    @foods = Food.all
    puts @foods
  end

  def new; end
end
