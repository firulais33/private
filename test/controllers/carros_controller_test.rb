require 'test_helper'

class CarrosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get carros_show_url
    assert_response :success
  end

end
