class VersionsController < ApplicationController
  def revert
    @version = Version.find params[:id]
    @version.reify.save!

    user = User.find params[:user_id]
    document = Document.find params[:document_id]

    redirect_to edit_user_document_path(user, document), :notice => "Reverted #{document.title}"
  end

  def show
    @user = User.find params[:user_id]
    @document = Document.find params[:document_id]
    @version = Version.find params[:id]
    @version_doc = @version.reify
  end

end
