class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.integer :training_id
      t.string :load
      t.timestamps
    end
  end
end
