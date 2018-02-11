class ApplicationController < ActionController::Base
  def require_user
    redirect_to '/auth/auth0' unless current_user.present?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # List of all available options: https://docs.imgix.com/apis/url
  def imgix_url(image, options = {})
    key = image.blob.key
    query = {auto: :format}.merge(options).to_query
    "https://remi-memorial-app.imgix.net/#{key}?#{query}"
  end

  helper_method :current_user
  helper_method :imgix_url
end
