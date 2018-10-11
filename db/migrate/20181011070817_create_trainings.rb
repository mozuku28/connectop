class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.integer :post_id
      t.integer :menu_id
      t.string :name
      t.integer :part_id
      t.integer :type
      t.timestamps
    end
  end
end
