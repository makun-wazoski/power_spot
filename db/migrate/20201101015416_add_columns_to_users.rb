class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    
    add_column :users, :introduction,  :text
    add_column :users, :favorite_spot, :string, null: false, default: ""
  end
end
