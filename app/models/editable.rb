class Editable < ActiveRecord::Base
  attr_accessible :document_id, :user_id, :title, :content
  attr_accessor :editor_email

  belongs_to :user
  belongs_to :document
end
