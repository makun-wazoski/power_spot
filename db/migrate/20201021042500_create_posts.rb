class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name,      null: false
      t.text :url,         null: false
      t.text :impressions, null: false
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end