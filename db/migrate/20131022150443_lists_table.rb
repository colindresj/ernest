class ListsTable < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :user_id
      t.integer :document_id

      t.timestamps
    end
    remove_column :documents, :user_id
  end
end
