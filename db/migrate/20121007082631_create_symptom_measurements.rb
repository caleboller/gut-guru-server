class CreateSymptomMeasurements < ActiveRecord::Migration
  def change
    create_table :symptom_measurements do |t|
      t.decimal :abdominal_pain
      t.decimal :bloating
      t.decimal :constipation
      t.decimal :diarrhea
      t.decimal :stress

      t.timestamps
    end
  end
end
