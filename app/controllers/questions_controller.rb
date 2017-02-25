class QuestionsController < ApplicationController
  before_action :set_question,  only: %i(show edit update destroy result)
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

    respond_to do |format|
      if @question.save
        format.html { redirect_to questions_url, notice: 'Question was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /questions/1
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to questions_url, notice: 'Question was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
    end
  end

  def propose
    return set_question unless params[:id] == '0'

    @question = Question.find_by(state: :init)
    return redirect_to over_questions_url unless @question
    return redirect_to @question if @question.update(state: :open)
  end

  def result
    @yes_count     = @question.yes_count
    @answers_count = @question.answers_count
  end

  def over
  end

  def init_all
    @questions.update_all(state: :init)
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully update.' }
    end
  end

  def delete_all
    @questions.destroy_all
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
    end
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
