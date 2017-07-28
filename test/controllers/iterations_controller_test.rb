require 'test_helper'

class IterationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get iterations_index_url
    assert_response :success
  end

  test "should get show" do
    get iterations_show_url
    assert_response :success
  end

end
