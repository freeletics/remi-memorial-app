class Auth0Controller < ApplicationController
  def callback
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to request.env['omniauth.origin'] || root_path
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
