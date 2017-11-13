# frozen_string_literal: true

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    @question = Question.new(body: 'test', state: 'init')
  end

  # バリデーションがかかっているかのテスト
  test 'should be valid?' do
    assert @question.valid?
  end

  # bodyのバリデーションのテスト
  test 'body should be present' do
    @question.body = '  '
    assert_not @question.valid?
  end

  # bodyの文字制限のテスト
  test 'body should not be too long' do
    @question.body = 'a' * 51
    assert_not @question.valid?
  end

  # stateのバリデーションのテスト
  test 'state should be present' do
    @question.state = '  '
    assert_not @question.valid?
  end

  # stateにinclusionが適応されているかのテスト
  test 'inclusion should be applied to state' do
    @question.state = 'test'
    assert_not @question.valid?
  end
end
