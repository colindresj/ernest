class CreateEditables < ActiveRecord::Migration
  def change
    create_table :editables do |t|
      t.string :title
      t.text :content
      t.integer :document_id
      t.integer :user_id

      t.timestamps
    end
  end
end
