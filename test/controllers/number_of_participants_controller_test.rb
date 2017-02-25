require 'test_helper'

class NumberOfParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @number_of_participant = number_of_participants(:one)
  end

  test 'should get index' do
    get number_of_participants_url
    assert_response :success
  end

  test 'should get new' do
    get new_number_of_participant_url
    assert_response :success
  end

  test 'should create number_of_participant' do
    assert_difference('NumberOfParticipant.count') do
      post number_of_participants_url, params: { number_of_participant: { number: @number_of_participant.number } }
    end

    assert_redirected_to number_of_participant_url(NumberOfParticipant.last)
  end

  test 'should show number_of_participant' do
    get number_of_participant_url(@number_of_participant)
    assert_response :success
  end

  test 'should get edit' do
    get edit_number_of_participant_url(@number_of_participant)
    assert_response :success
  end

  test 'should update number_of_participant' do
    patch number_of_participant_url(@number_of_participant), params: { number_of_participant: { number: @number_of_participant.number } }
    assert_redirected_to number_of_participant_url(@number_of_participant)
  end

  test 'should destroy number_of_participant' do
    assert_difference('NumberOfParticipant.count', -1) do
      delete number_of_participant_url(@number_of_participant)
    end

    assert_redirected_to number_of_participants_url
  end
end
