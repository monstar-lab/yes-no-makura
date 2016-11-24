class AnswersController < ApplicationController
  def home
    if params[:cookie_key].blank?
      redirect_to action: 'home', cookie_key: SecureRandom.uuid
    end
  end

  def agree
    reply(true)
  end

  def disagree
    reply(false)
  end

  private

  def reply(answer)
    question = Question.find_by(state: 'open')
    if question.present?
      @answer = Answer.find_or_create_by(cookie_key: params[:cookie_key], question_id: question.id)
      @answer.cookie_key = params[:cookie_key]
      @answer.yes = answer
      @answer.save
    end
    redirect_to action: 'home', cookie_key: params[:cookie_key]
  end
end
