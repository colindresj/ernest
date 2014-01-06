class EditablesController < ApplicationController

  before_filter :authorize
  before_filter :correct_user, :only => [:edit]
  before_filter :find_user_and_editable, :except => [:create]

  def show
    # @editable and @user in before_filter
  end

  def create
    user = User.find params[:user_id]
    document = Document.find params[:document_id]
    editor = User.where(:email => params[:editable][:editor_email]).first

    editors = document.gather_editors(Array.new)

    if editor.present?
      if params[:editable][:editor_email] == user.email
        redirect_to :back, :notice => "Sorry, you can't make yourself an editor!"
      elsif editors.include? editor.id
        redirect_to :back, :notice => "Sorry, this person already has editing access."
      else
        editable = Editable.new
        editable.assign_document_and_editor(document, editor)
        editable.save

        redirect_to :back, :notice => "#{editor.email} can now propose edits to #{document.title}."
      end
    else
      redirect_to :back, :notice => "We couldn't find anyone on Ernest with that email."
    end
  end

  def edit
    # @editable and @user in before_filter
  end

  def update
    # @editable and @user in before_filter
    @editable.update_attributes params[:editable]
    redirect_to :back, :notice => "#{@editable.title} edits recorded."
  end

  private
  def find_user_and_editable
    unless params[:user_id].nil?
      @user = User.find params[:user_id]
      @editable = @user.editables.find params[:id]
    else
      @editable = Editable.find params[:id]
    end
  end

end
