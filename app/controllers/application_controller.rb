class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/auth/auth0' unless current_user.present?
  end

  helper_method :current_user
end
