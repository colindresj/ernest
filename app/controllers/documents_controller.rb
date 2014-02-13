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
    document = @user.documents.new params[:document]
    if document.save
      document.create_dbox_file(dropbox_client)
      redirect_to edit_user_document_path(@user, document), :notice => "#{document.title} saved."
    else
      redirect_to :back, :alert => "#{document.title} could not be saved."
    end
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
    document_prev_state = document
    db_client = dropbox_client

    if document.update_attributes params[:document]
      begin
        if document_prev_state.title == document.title
          db_client.upload "#{document.title}.md", document.content
        else
          file = db_client.find"#{document_prev_state.title}.md"
          file.destroy
          db_client.upload "#{document.title}.md", document.content
        end
      rescue
      ensure
      end

      redirect_to edit_user_document_path(@user, document), :notice => "#{document.title} saved."
    else
      redirect_to :back, :alert => "#{document.title} could not be saved."
    end
  end

  def destroy
    document = @user.documents.find params[:id]
    document.delete_dbox_file(dropbox_client)
    if document.destroy
      redirect_to :back, :notice => "#{document.title} deleted."
    else
      redirect_to :back, :alert => "#{document.title} could not be deleted."
    end
  end

  private
  def get_user
    @user = User.find params[:user_id]
  end

end
