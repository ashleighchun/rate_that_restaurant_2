class ApplicationController < ActionController::Base
  #before_action :authenticate_user!, except: [:home]



  def home
    redirect_to reviews_path if user_signed_in?
  end

  #current_user method returns current signed-in user,
  #while user_signed_in? method is used to verify if any user
  #is signed in and returns true or false. if user_signed_in? is
  #false then current_user method will return nil.


end
