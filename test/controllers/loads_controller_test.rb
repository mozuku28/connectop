require 'test_helper'

class LoadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loads_index_url
    assert_response :success
  end

end
