class Api::V1::SymptomMeasurementsController < ApplicationController
	
	def create
		measurement = SymptomMeasurement.create!(params[:symptom_measurement])
		measurement.composite_score = measurement.abdominal_pain + measurement.constipation + measurement.bloating + measurement.diarrhea
		measurement.save!
		current_user.symptom_measurements << measurement
		render :json => {:success => true}, :status => 200
	end

	def report
		top = current_user.top_symptom_measurements
		bottom = current_user.bottom_symptom_measurements

		
		gluten = 0
		lactose = 0
		fat = 0
		top.each do |measurement|
			if measurement.suspect_food_entries_for_user(current_user)[0].gluten == true
				gluten += 1
			end
			if measurement.suspect_food_entries_for_user(current_user)[0].lactose == true
				lactose += 1
			end
		end

		top_hash = {"lactose" => 2, "gluten" => 4, "fat" => 1}
		bottom_hash = {"lactose" => "2", "gluten" => 1, "fat" => 2}

		render :json => {:top => top_hash.to_json, :bottom => bottom_hash.to_json}, :status => 200
	end
end
