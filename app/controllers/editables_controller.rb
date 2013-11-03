class EditablesController < ApplicationController

  before_filter :authorize
  before_filter :correct_user, :only => [:edit]

  def show
    @editable = Editable.find params[:id]
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
        editable.title = document.title
        editable.content = document.content
        editable.document_id = document.id
        editable.user_id = editor.id

        editable.save

        redirect_to :back, :notice => "#{editor.email} can now propose edits to #{document.title}."
      end
    else
      redirect_to :back, :notice => "We couldn't find anyone on Ernest with that email."
    end
  end

  def edit
    @user = User.find params[:user_id]
    @editable = Editable.find params[:id]
  end

  def update
    user = User.find params[:user_id]
    editable = Editable.find params[:id]

    editable.update_attributes params[:editable]
    redirect_to :back, :notice => "#{editable.title} edits recorded."
  end

end
