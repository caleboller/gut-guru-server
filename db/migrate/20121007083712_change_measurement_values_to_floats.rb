class ChangeMeasurementValuesToFloats < ActiveRecord::Migration
  def up
  	change_column :symptom_measurements, :abdominal_pain, :float
  	change_column :symptom_measurements, :bloating, :float
  	change_column :symptom_measurements, :constipation, :float
  	change_column :symptom_measurements, :diarrhea, :float
  	change_column :symptom_measurements, :stress, :float
    end

  def down
  end
end
