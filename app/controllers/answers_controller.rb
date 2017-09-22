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

    if question
      Answer.find_or_initialize_by(attributes).update(results)
      AnswersChannel.broadcast_answer_info(question.id)
    end

    redirect_to action: :new, cookie_key: cookie
  end

  # DELETE /answers/delete_all
  def delete_all
    Answer.destroy_all
    redirect_to questions_url, notice: 'Answer was successfully destroyed.'
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params.permit(:cookie_key, :yes)
  end
end
