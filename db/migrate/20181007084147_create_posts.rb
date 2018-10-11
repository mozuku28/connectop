class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :memo
      t.integer :menu_id
      t.integer :user_id
      t.text :image_id
      t.timestamps
    end
  end
end
