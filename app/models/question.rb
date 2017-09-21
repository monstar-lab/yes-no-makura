class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  validates :body, presence: true, length: { maximum: 50 }
  validates :state, presence: true, inclusion: { in: %w(init open close) }

  def yes_count
    answers.yeses.count
  end

  def answers_count
    answers.count
  end
end
