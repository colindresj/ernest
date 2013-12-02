class DocumentsController < ApplicationController
  before_filter :authorize
  before_filter :correct_user
  before_filter :get_user

  def index
    unless params[:q]
      redirect_to user_path(@user)
    else
      @documents = Document.search params[:q]
    end
  end

  def new
    @document = Document.new
  end

  def create
    document = @user.documents.create params[:document]
    document.create_dbox_file(dropbox_client)

    redirect_to edit_user_document_path(@user, document), :notice => "#{document.title} saved."
  end

  def show
    @document = @user.documents.find params[:id]
  end

  def edit
    @document = @user.documents.find params[:id]
    @editable = Editable.new
  end

  def update
    document = @user.documents.find params[:id]
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

  def destroy
    document = @user.documents.find params[:id]
    document.delete_dbox_file(dropbox_client)
    document.destroy

    redirect_to :back, :notice => "#{document.title} deleted."
  end

  def get_user
    @user = User.find params[:user_id]
  end

end
