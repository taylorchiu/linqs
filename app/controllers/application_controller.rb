class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
<<<<<<< HEAD
  # protect_from_forgery with: :exception
  before_action :authenticate_user!
=======
  protect_from_forgery with: :exception
  before_action :authenticate_user! 
>>>>>>> 48290b8528a11f42af859fd758027a4bd5243175

end
