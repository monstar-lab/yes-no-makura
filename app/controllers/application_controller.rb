class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # GET /admin
  def admin
  end
end
