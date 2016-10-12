class QuestionMastersController < ApplicationController


  def start
  end

  def result
  end

  def close_questions
    @question = Question.find(params[:id])
    @question.state = "close"
    @question.save
    redirect_to controller: 'question_masters', action: 'result', id: @question.id
  end
end
