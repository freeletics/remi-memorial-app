class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to '/'
  end
end
