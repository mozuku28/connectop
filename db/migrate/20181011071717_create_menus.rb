class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :part_id
      t.integer :type_id
      t.integer :user_id
      t.timestamps
    end
  end
end
