require 'test_helper'

class RecipiesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get recipies_index_url
    assert_response :success
  end

  test 'should get show' do
    get recipies_show_url
    assert_response :success
  end
end
