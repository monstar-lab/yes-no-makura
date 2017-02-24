class NumberOfParticipant < ActiveRecord::Base
  validate :number_of_participant_too_many_numbers, on: :create
  def number_of_participant_too_many_numbers
    if NumberOfParticipant.all.count > 0
      errors[:base] << "too_many_numbers"
    end
  end
end
