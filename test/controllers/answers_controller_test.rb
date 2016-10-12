require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get answers_home_url
    assert_response :success
  end

end
