class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.integer :post_id
      t.string :name
      t.timestamps
    end
  end
end
