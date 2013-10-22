class RemoveLists < ActiveRecord::Migration
  def change
    drop_table :lists
    add_column :documents, :user_id, :integer
  end
end
