class DocumentsController < ApplicationController

  before_filter :authorize
  before_filter :correct_user

  def index
    redirect_to user_path(@user)
  end

  def new
    @user = User.find params[:user_id]
    @document = Document.new
  end

  def create
    document = Document.new params[:document]
    user = User.find params[:user_id]
    document.user = user
    document.save
    redirect_to edit_user_document_path(user, document), :notice => "#{document.title} saved."
  end

  def show
    @user = User.find params[:user_id]
    @document = Document.find params[:id]
  end

  def edit
    @user = User.find params[:user_id]
    @document = Document.find params[:id]
    @editable = Editable.new
  end

  def update
    user = User.find params[:user_id]
    document = Document.find params[:id]

    document.update_attributes params[:document]
    redirect_to edit_user_document_path(user, document), :notice => "#{document.title} saved."
  end

  def delete
  end

  def destroy
    document = Document.find params[:id]

    document.destroy

    redirect_to :back, :notice => "#{document.title} deleted."
  end

end
