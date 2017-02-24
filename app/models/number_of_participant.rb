class NumberOfParticipant < ActiveRecord::Base
  validate on: :create do
    return unless NumberOfParticipant.exists?
    errors[:base] << "can't create any more"
  end
end
