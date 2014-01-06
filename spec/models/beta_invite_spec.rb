require "spec_helper"

describe BetaInvite do
  before(:each) do
    @invite = create(:beta_invite)
  end

  it "grants access" do
    @invite.grantaccess.save!
    expect(@invite.access).to be_true
  end
end
