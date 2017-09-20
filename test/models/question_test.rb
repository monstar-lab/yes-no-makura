require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
      @question = Question.new(body: "test", state: "init")
  end

  # バリデーションがかかっているかのテスト
  test "should be valid?" do
   assert @question.valid?
  end

  test "body should be present" do
    @question.body = "  "
    assert_not @question.valid?
  end

  # 質問の文字制限のテスト
  test "body should not be too long" do
    @question.body = "a" * 51
    assert_not @question.valid?
  end
end
