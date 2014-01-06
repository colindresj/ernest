class VersionsController < ApplicationController

  before_filter :authorize, :only => [:show]
  before_filter :find_document_versions

  def revert
    @version.reify.save!
    redirect_to edit_user_document_path(@user, @document), :notice => "Reverted #{@document.title}"
  end

  def show
    @version_doc = @version.reify
  end

  private
  def find_document_versions
    @user = User.find params[:user_id]
    @document = @user.documents.find params[:document_id]
    @version = @document.versions.find params[:id]
  end

end
