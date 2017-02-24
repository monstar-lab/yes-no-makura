class Question < ApplicationRecord
  def yes_count(question)
      @yes_count = Answer.where(question: question).where(yes: true).count
  end
  def answers_count(question)
    @answers_count = Answer.where(question: question).count
  end
end
