class DocumentsController < ApplicationController

  def index
    @user = User.find params[:user_id]
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
    redirect_to edit_user_document_path(user, document), :notice => 'Document saved.'
  end

  def show
  end

  def edit
    @user = User.find params[:user_id]
    @document = Document.find params[:id]
  end

  def update
    # binding.pry
    user = User.find params[:user_id]
    document = Document.find params[:id]

    document.update_attributes params[:document]

    redirect_to edit_user_document_path(user, document), :notice => 'Document saved.'
  end

  def delete
  end

  def destroy
  end

end
