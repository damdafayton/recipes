require 'rails_helper'

RSpec.describe 'New food page,' do
  before do
    visit new_food_path
  end

  describe 'redirects' do
    it 'to login' do
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end
  end
end
