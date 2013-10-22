class SessionController < ApplicationController

  def new
  end

  def create
    user = User.where(email: params[:email]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, :notice => "Welcome back #{user.email}!"
    else
      redirect_to login_path, :notice => 'Wrong email or password.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => 'Succesfully logged out.'
  end

end
