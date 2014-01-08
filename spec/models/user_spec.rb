require "spec_helper"

describe User do

  context "without access granted" do
    it "cannot create a user yet" do
      user = build_stubbed(:user, email: "notYetInvited@test.com", password: "rumbleInTheJungle123", password_confirmation: "rumbleInTheJungle123")
      expect { user.save }.to raise_error
    end
  end

  context "with access granted" do
    before(:each) do
      @user = create(:user, email: "tarzan@test.com", password: "rumbleInTheJungle123", password_confirmation: "rumbleInTheJungle123")
    end

    describe "#authenticate" do
      it "authenticates with correct password" do
        expect(@user.authenticate("rumbleInTheJungle123")).to eq(@user)
      end

      it "does not authenticate with incorrect password" do
        expect(@user.authenticate("wrongPassword")).to be_false
      end
    end

    it { should have_secure_password }

    it { should ensure_length_of(:password).is_at_least(6).is_at_most(20) }

    it { should validate_uniqueness_of(:email) }

    it { should validate_presence_of(:email) }

    it { should validate_presence_of(:password) }

    it { should validate_presence_of(:password_confirmation) }

    it { should have_many(:documents) }

    it { should have_many(:editables) }

    it { should have_db_column(:auth_token) }

  end
end
