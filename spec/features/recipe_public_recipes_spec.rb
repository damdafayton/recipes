require 'rails_helper'

RSpec.describe 'Public recipes page,' do
  before do
    @recipe1 = Recipe.includes(:user, :recipe_foods).all.where(public: true).order(created_at: :desc)[0]
    puts @recipe1
    visit root_path
  end

  describe 'renders' do
    it 'user\'s name' do
      expect(page).to have_content(@recipe1.name)
    end
  end
end
