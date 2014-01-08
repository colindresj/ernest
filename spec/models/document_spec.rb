require "spec_helper"

describe Document do
  context "when not title is entered on save" do
    it "self titles with 'Untitled'" do
      document = create(:document, title: "")
      expect(document.title).to eq("Untitled")
    end
  end

  it { should have_many(:editables) }

  it { should belong_to(:user) }
end
