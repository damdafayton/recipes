class RemoveColumnFromRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipe_foods, :quanity, :integer
  end
end
