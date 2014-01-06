# == Schema Information
#
# Table name: editables
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text
#  document_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Editable < ActiveRecord::Base
  attr_accessible :document_id, :user_id, :title, :content
  attr_accessor :editor_email

  belongs_to :user
  belongs_to :document

  def assign_document_and_editor(parent_document, editor)
    self.title = parent_document.title
    self.content = parent_document.content
    self.document_id = parent_document.id
    self.user_id = editor.id
    self
  end
end
