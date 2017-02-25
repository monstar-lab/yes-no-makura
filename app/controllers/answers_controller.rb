class AnswersController < ApplicationController
  # GET /answers/new
  def new
    @cookie = answer_params[:cookie_key]
    redirect_to action: :new, cookie_key: SecureRandom.uuid unless @cookie
  end

  # POST /answers
  def create
    question   = Question.find_by(state: :open)
    cookie     = answer_params[:cookie_key]
    attributes = { question: question, cookie_key: cookie }
    results    = { yes: answer_params[:yes] }
    Answer.find_or_initialize_by(attributes).update(results) if question
    redirect_to action: :new, cookie_key: cookie
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params.permit(:cookie_key, :yes)
  end
end
