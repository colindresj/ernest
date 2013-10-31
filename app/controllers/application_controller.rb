class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find_by_auth_token! cookies[:auth_token] if cookies[:auth_token]
  end
  helper_method :current_user

  def dropbox_client
   Dropbox::API::Client.new :token => session[:access_token], :secret => session[:secret_token]
  end
  helper_method :dropbox_client

  def authorize
    redirect_to login_path, :alert => 'Sorry, you can\'t do that!' if current_user.nil?
  end

  def correct_user
    if params[:user_id].present?
      user = User.find params[:user_id]
    else
      user = User.find params[:id]
    end
    unless current_user == (user)
      redirect_to user_path(current_user), :alert => "Not your account."
    end
  end

end
