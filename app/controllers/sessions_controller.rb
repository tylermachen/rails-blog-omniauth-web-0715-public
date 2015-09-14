class SessionsController < ApplicationController
  def create
    user = User.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])
    if user
      redirect_to root_path, :notice => "Welcome back, #{user.name}!"
    else
      user = User.create_with_omniauth(auth_hash)
      redirect_to root_path
    end
    session[:user_id] = user.id
  end

  def destroy
    log_out if user_signed_in?
    redirect_to root_url
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
