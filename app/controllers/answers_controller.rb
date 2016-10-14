class AnswersController < ApplicationController
  def home
    unless @answer = Answer.find_by_cookie_key(params[:cookie_key])
      @answer = Answer.new
      @answer.question = Question.find_by!(state: 'open')
      @answer.cookie_key = SecureRandom.uuid
      @answer.save!
    end
  end

  def agree
    @answer = Answer.find_by!("cookie_key = '#{params[:cookie_key]}'")
    @answer.question = Question.find_by!(state: 'open')
    @answer.yes = true
    @answer.save!
    redirect_to action: 'home', cookie_key: params[:cookie_key]
  end

  def disagree
    @answer = Answer.find_by!("cookie_key = '#{params[:cookie_key]}'")
    @answer.question = Question.find_by!(state: 'open')
    @answer.yes = false
    @answer.save!
    redirect_to action: 'home', cookie_key: params[:cookie_key]
  end
end
