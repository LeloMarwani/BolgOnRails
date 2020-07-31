class ApplicationController < ActionController::Base
  before_action :authorized
helper_method :current_user
helper_method :logged_in?
def current_user
    User.find_by(id: session[:user_id])
end
def logged_in?
       
    !current_user.nil?
end
def authorized
   redirect_to '/welcome' unless logged_in?
end
protect_from_forgery
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end

end
  