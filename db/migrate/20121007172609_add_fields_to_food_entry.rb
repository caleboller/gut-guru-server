class AddFieldsToFoodEntry < ActiveRecord::Migration
  def change
  	add_column :food_entries, :fat_g, :float
  	add_column :food_entries, :weight_g, :float
  	add_column :food_entries, :gluten, :bool
  	add_column :food_entries, :lactose, :bool
  end
end
