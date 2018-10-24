class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.integer :post_id
      t.integer :menu_id
      t.timestamps
    end
  end
end
