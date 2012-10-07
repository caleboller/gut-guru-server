class AddCompositeScoreToMeasurement < ActiveRecord::Migration
  def change
  	add_column :food_entries, :composite_score, :float, :defauly => 0
  end
end
