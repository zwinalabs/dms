class CreateGeds < ActiveRecord::Migration
  def change
    create_table :geds do |t|
      t.text :url
      t.string :title
      t.references :issue
      t.references :user

      t.timestamps
    end
    add_index :geds, :issue_id
    add_index :geds, :user_id
  end
end