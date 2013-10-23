class EditablesController < ApplicationController

  def create
    user = User.find params[:user_id]
    document = Document.find params[:document_id]
    editor = User.where(:email => params[:editable][:editor_email]).first

    # Create the editors array to make sure that the person doesn't already have editing acces
    # so we can prevent duplicate editables for a user
    editors = []
    document.editables.each do |editable|
      editors << editable.user_id
    end


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

end
