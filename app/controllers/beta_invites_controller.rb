class BetaInvitesController < ApplicationController

  def new
    @beta_invite = BetaInvite.new
  end

  def create
    @beta_invite = BetaInvite.new params[:beta_invite]
    if @beta_invite.save
      redirect_to root_path, notice: 'Thanks for requesting access! We\'ll let you know when you can access Ernest.'
    else
      render :new
    end
  end

end
