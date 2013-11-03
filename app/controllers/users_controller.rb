class UsersController < ApplicationController

  before_filter :authorize, only: [:show, :index, :edit]
  before_filter :correct_user, only: [:show, :index, :edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to login_path, notice: 'Thanks for signing up! You can now log in.'
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
    if params[:tag_id]
      @documents = @user.documents.tagged_with params[:tag_id]
    elsif params[:q] && params[:q].present? != false
      @documents = @user.documents.search params[:q]
    else
      @documents = Document.where :user_id => @user.id
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]

    if user && user.authenticate(params[:user][:password])
      user.name = params[:user][:name]
      user.email = params[:user][:email]
      user.password = params[:user][:password]
      user.password_confirmation = params[:user][:password]
      user.save!
      redirect_to user_path(user), :notice => 'Settings saved.'
    else
      redirect_to :back, :alert => 'Wrong password.'
    end
  end

  def landing
    if current_user
      auth_token = cookies[:auth_token]
      logged_in_user = User.where(:auth_token => auth_token).first
      redirect_to user_path logged_in_user
    end
  end

end
