class DocumentsController < ApplicationController

  before_filter :authorize
  before_filter :correct_user

  def index
    unless params[:q]
      @user = User.find params[:user_id]
      redirect_to user_path(@user)
    else
      @documents = Document.search params[:q]
    end
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

    if document.title.empty?
      document.title = 'Untitled'
      document.save
    end

    db_client = dropbox_client
    begin
        db_client.upload "#{document.title}.md", document.content
    rescue
    ensure
    end

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

    db_client = dropbox_client
    begin
      if document.title == params[:document][:title]
        db_client.upload "#{params[:document][:title]}.md", params[:document][:content]
      else
        file = db_client.find"#{document.title}.md"
        file.destroy
        db_client.upload "#{params[:document][:title]}.md", document.content
      end
    rescue
    ensure
    end

    document.update_attributes params[:document]

    redirect_to edit_user_document_path(user, document), :notice => "#{document.title} saved."
  end

  def delete
  end

  def destroy
    document = Document.find params[:id]

    db_client = dropbox_client
    begin
      file = db_client.find"#{document.title}.md"
      file.destroy
    rescue
    ensure
    end

    document.destroy

    redirect_to :back, :notice => "#{document.title} deleted."
  end

end
