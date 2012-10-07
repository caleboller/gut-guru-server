class AddCompositeScoreToMeasurementAgain < ActiveRecord::Migration
  def change
  	add_column :symptom_measurements, :composite_score, :float, :default => 0
  end
end
