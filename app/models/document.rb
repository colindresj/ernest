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
  has_paper_trail :on => [:update]

  belongs_to :user
  has_many :editables

  def self.search(query)
    where "title @@ :q or content @@ :q", q: query
  end

  def add_untitled
    self.title = 'Untitled'
    self.save
  end

  def create_dbox_file(db_client)
    begin
        db_client.upload "#{self.title}.md", self.content
    rescue
    ensure
    end
  end

  def delete_dbox_file(db_client)
    begin
      file = db_client.find"#{self.title}.md"
      file.destroy
    rescue
    ensure
    end
  end

end
