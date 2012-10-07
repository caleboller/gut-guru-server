class FixIdForRelationships < ActiveRecord::Migration
  def up
  	remove_column :symptom_measurements, :user_id
  	add_column :symptom_measurements, :user_id, :integer
  	
  	remove_column :food_entries, :user_id
  	add_column :food_entries, :user_id, :integer
  end

  def down
  end
end
