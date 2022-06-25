require 'rails_helper'

RSpec.describe 'Recipes index page,' do
  before do
    @recipe = Recipe.all
    visit recipes_path
  end

  describe 'renders' do
    it 'recipe\'s name' do
      expect(page).to have_content(@recipe.name)
    end
  end
end
