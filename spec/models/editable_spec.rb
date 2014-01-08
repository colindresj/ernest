require "spec_helper"

describe Editable do

  describe "#assign_document_and_editor" do
    before(:each) do
      @editor = create(:user)
      @parent_document = create(:document, title: "Testing", content: "testing content")
      @editable = create(:editable)
      @editable.assign_document_and_editor(@parent_document, @editor).save!
    end

    it "takes the title of its parent document" do
      expect(@editable.title).to eq(@parent_document.title)
    end

    it "takes the content of its parent document" do
      expect(@editable.content).to eq(@parent_document.content)
    end

    it "has an editor" do
      expect(@editable.content).to eq(@parent_document.content)
    end
  end

  it { should belong_to(:user) }

  it { should belong_to(:document) }
end
