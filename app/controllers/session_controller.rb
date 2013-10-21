class SessionController < ApplicationController

  def new
  end

  def create
    user = User.where(email: params[:email]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      redirect_to login_path, :notice => 'Wrong email or password.'
    end
  end

  def show
    @user = User.find params[:id]
  end

end
