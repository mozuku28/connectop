class CreateLoads < ActiveRecord::Migration[5.2]
  def change
    create_table :loads do |t|
      t.integer :training_id
      t.integer :post_id
      t.integer :times
      t.float :load
      t.float :distance
      t.time :time
      t.timestamps
    end
  end
end
