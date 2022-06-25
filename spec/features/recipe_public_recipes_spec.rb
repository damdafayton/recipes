require 'rails_helper'


RSpec.describe 'Public recipes page,'do
  before do
    first_user = User.create(name: "Kuti")
    @recipe1 = Recipe.create(name: "First recipe", preparation_time: "25 minutes", cooking_time: "1.33 hours", description: "cook it well",public: true,user_id: first_user.id)
    puts @recipe1
    visit root_path
  end

  describe 'renders' do
    it 'user\'s name' do
      expect(page).to have_content(@recipe1.name)
    end
  end

end