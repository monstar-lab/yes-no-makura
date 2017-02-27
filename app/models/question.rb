class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  def yes_count
    answers.yeses.count
  end

  def answers_count
    answers.count
  end
end
