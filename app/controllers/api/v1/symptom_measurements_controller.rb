class Api::V1::SymptomMeasurementsController < ApplicationController
	
	def create
		current_user.symptom_measurements << SymptomMeasurement.create!(params[:symptom_measurement])
		render :json => {:success => true}, :status => 200
	end
end
