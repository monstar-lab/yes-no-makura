require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'should get admin' do
    get admin_url
    assert_response :success
  end
end
