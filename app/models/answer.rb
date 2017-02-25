class Answer < ApplicationRecord
  belongs_to :question

  scope :yeses, -> { where(yes: true) }
end
