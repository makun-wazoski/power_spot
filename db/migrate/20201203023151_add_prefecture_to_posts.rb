class AddPrefectureToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :prefecture_id, :integer, null: false
  end
end
