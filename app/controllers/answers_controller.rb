class AnswersController < ApplicationController
  def home

  end

  def agree

    redirect_to action: 'home'
  end

  def disagree

    redirect_to action: 'home'
  end
end
