# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Document < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :tag_list
  acts_as_taggable

  belongs_to :user
end
