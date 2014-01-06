require "spec_helper"

describe BetaInvite do
  before(:each) do
    @invite = create(:beta_invite)
    @invite.grantaccess.save!
  end

  it "grants access" do
    expect(@invite.access).to be_true
  end
end
