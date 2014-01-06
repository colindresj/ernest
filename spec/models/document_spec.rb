require "spec_helper"

describe Document do
  it "self titles with 'Untitled' if no title is entered on save" do
    document = create(:document, title: "")
    expect(document.title).to eq("Untitled")
  end

  it { should have_many(:editables) }

  it { should belong_to(:user) }
end
