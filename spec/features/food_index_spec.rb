require 'rails_helper'

RSpec.describe 'Food index page,' do
  before do
    @food1 = Food.all[0]
    visit foods_path
  end

  describe 'renders' do
    it 'food\'s name' do
      expect(page).to have_content(@food1.name)
    end
  end
end
