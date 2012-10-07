class AddDefaultsToMeasurements < ActiveRecord::Migration
  def change
  	change_column :symptom_measurements, :abdominal_pain, :float, :default => 0
  	change_column :symptom_measurements, :constipation, :float, :default => 0
  	change_column :symptom_measurements, :bloating, :float, :default => 0
  	change_column :symptom_measurements, :diarrhea, :float, :default => 0
  	change_column :symptom_measurements, :stress, :float, :default => 0
  end
end
