require "spec_helper"

describe BetaInvite do
  before(:each) do
    @invite = create(:beta_invite)
  end

  describe ".grantaccess" do
    it "grants access" do
      @invite.grantaccess.save!
      expect(@invite.access).to be_true
    end
  end
end
