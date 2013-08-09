class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.references :user
      t.string :from_name
      t.string :from_email
      t.string :to_email
      t.string :subject
      t.text :html_body
      t.text :text_body

      t.timestamps
    end
    add_index :drafts, :user_id
  end
end
