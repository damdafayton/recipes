class UsersController < ApplicationController
  def general_shopping_list
    
    @user = current_user

    (@required_foods_list, @required_foods_in_users_recipes,
    @required_foods_in_users_inventory, @cost_of_missing_foods_in_recipes) = @user.required_foods_data
  rescue StandardError
    nil
  end
end
