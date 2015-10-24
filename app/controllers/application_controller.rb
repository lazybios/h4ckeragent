class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user || User.find_by_token(session[:token]) if session[:token]
  end


  def require_user
    if current_user.blank?
      redirect_to :login
    end
  end

  helper_method :current_user
end
