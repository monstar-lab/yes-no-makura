class AnswersController < ApplicationController
  def home
    if params[:cookie_key].blank?
      redirect_to action: 'home', cookie_key: SecureRandom.uuid
    end
  end

  def agree
    @answer = Answer.find_by!(cookie_key: params[:cookie_key])
    unless @answer.question = Question.find_by(state: 'open')
      redirect_to action: 'home', cookie_key: params[:cookie_key]
      return
    else
      @answer.yes = true
      @answer.save!
      redirect_to action: 'home', cookie_key: params[:cookie_key]
    end
  end

  def disagree
    @answer = Answer.find_by!(cookie_key: params[:cookie_key])
    unless @answer.question  = Question.find_by(state: 'open')
      redirect_to action: 'home', cookie_key: params[:cookie_key]
      return
    else
      @answer.yes = false
      @answer.save!
      redirect_to action: 'home', cookie_key: params[:cookie_key]
    end
  end
end
