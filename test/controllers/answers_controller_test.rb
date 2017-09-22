require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cookie = SecureRandom.uuid
    @answer = answers(:one)
  end

  test 'should get index' do
    get root_url, params: { cookie_key: @cookie }
    assert_response :success
  end

  test 'should get new answer' do
    post answers_url , params: { cookie_key: @cookie }
    assert_response :success
  end

  test 'should destroy answer' do
    assert_difference('Answer.count', -1) do
      delete question_url(@answer)
    end

    assert_redirected_to questions_url
  end
end
