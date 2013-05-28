class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?
# before_filter :require_user
  def require_user
  	unless logged_in?
  		flash[:error] = "You must be logged in to do that!!"
  		redirect_to root_path
  	end # end-unless
  end
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	# User.find(session[:user_id]) is the meat. It returns the user obj. based off of the :user_id.
  	# "if session[:user_id]" says that only return the user objection only if there is something in 
 		# "session[:user_id]".  :user_id is the current user.
 		# ||= is memoization
 		# @current_user will return nil if no user object. If nil, then "logged_in" will return false.
  end

  def logged_in?
  	!!current_user
  end
end
