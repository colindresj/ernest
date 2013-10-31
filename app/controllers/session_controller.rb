class SessionController < ApplicationController

  def new
  end

  def create
    user = User.where(email: params[:email]).first

    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
        # session[:user_id] = user.id
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to user
    else
      redirect_to login_path, :alert => 'Wrong email or password.'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    # session[:user_id] = nil
    redirect_to login_path, :notice => 'Succesfully logged out.'
  end

end
