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
end
