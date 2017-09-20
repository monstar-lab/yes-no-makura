class QuestionsController < ApplicationController
  before_action :set_question,  only: %i(show edit update destroy close result)
  before_action :set_questions, only: %i(index init_all delete_all)

  # GET /questions
  def index
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_url, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      redirect_to questions_url, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  # GET /questions/1/propose
  def propose
    return set_question unless params[:id] == '0'
    @now_question = Question.find_by(state: :open)
    @now_question.update(state: :close) if @now_question
    @question = Question.find_by(state: :init)
    return redirect_to over_questions_url unless @question

    if @question.update(state: :open)
      redirect_to propose_question_url(@question)
    end
  end

  # PATCH /questions/1/close
  def close
      redirect_to result_question_url(@question)
  end

  # GET /questions/1/result
  def result
    @yes_count     = @question.yes_count
    @answers_count = @question.answers_count
  end

  # GET /questions/over
  def over
  end

  # PATCH /questions/init_all
  def init_all
    @questions.update_all(state: :init)
    redirect_to questions_url, notice: 'Question was successfully update.'
  end

  # DELETE /questions/delete_all
  def delete_all
    @questions.destroy_all
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  def set_questions
    @questions = Question.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:body, :state)
  end
end
