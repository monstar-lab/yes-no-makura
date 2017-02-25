class Question < ApplicationRecord
  has_many :answers

  def yes_count
    answers.yeses.count
  end

  def answers_count
    answers.count
  end
end
