class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.integer :menu_id
      t.integer :user_id
      t.timestamps
    end
  end
end
