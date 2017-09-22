class AnswersChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'answers:count'
  end

  def unsubscribed
  end

  class << self
    def broadcast_answer_info(question_id)
      answers = Answer.where(question_id: question_id)
      answers_info = {
          yes_count: answers.yeses.count,
          answers_count: answers.count,
          current_id:  question_id
      }
      AnswersChannel.broadcast_to('count', answers_info)
    end
  end

end
