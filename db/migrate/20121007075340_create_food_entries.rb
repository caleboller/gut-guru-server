class CreateFoodEntries < ActiveRecord::Migration
  def change
    create_table :food_entries do |t|
      t.string :user_id
      t.string :description
      t.integer :score

      t.timestamps
    end
  end
end
