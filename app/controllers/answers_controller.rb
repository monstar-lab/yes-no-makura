class AnswersController < ApplicationController
  def new
    @cookie = params[:cookie_key]
    redirect_to action: :new, cookie_key: SecureRandom.uuid unless @cookie
  end

  def create
    question   = Question.find_by(state: :open)
    cookie     = params[:cookie_key]
    attributes = { question: question, cookie_key: cookie }
    results    = { yes: params[:yes] }
    Answer.find_or_initialize_by(attributes).update(results) if question
    redirect_to action: :new, cookie_key: cookie
  end
end
