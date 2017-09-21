class TotalChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'total:editnum'
  end

  def unsubscribed
  end

  class << self
    def broadcast_answer_info(question_id)
      answers = Answer.where(question_id: question_id)
      answers_info = {
          yescon: answers.yeses.count,
          anscon: answers.count,
          nowid:  question_id
      }
      TotalChannel.broadcast_to('editnum', answers_info)
    end
  end

end
