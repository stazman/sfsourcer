require 'test_helper'

class FpCreatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get fp_creators_name_url
    assert_response :success
  end

end
