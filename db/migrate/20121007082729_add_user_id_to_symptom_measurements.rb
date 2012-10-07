class AddUserIdToSymptomMeasurements < ActiveRecord::Migration
  def change
  	add_column :symptom_measurements, :user_id, :string
  end
end
