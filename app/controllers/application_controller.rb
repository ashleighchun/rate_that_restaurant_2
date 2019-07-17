class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:home]


  def home
  end

  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) #memoization
  end
end
