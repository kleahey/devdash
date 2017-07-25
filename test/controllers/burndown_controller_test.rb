require 'test_helper'

class BurndownControllerTest < ActionDispatch::IntegrationTest
  test "should get current" do
    get burndown_current_url
    assert_response :success
  end

end
