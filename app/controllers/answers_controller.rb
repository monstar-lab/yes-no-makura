class AnswersController < ApplicationController
  def home
    unless Answer.find_by("cookie_key = '#{params[:cookie_key]}'")
      @answer = Answer.new
      @answer.question = Question.first
      @answer.cookie_key = SecureRandom.uuid
      @answer.save!
    end
  end

  def agree
    redirect_to action: 'home'
  end

  def disagree

    redirect_to action: 'home'
  end
end
