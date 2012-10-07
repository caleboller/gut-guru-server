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
		
		top_hash = Hash.new()
		top_hash["abdominal_pain"] = top.map{|x| x.abdominal_pain}.inject(0, :+)
		top_hash["constipation"] = top.map{|x| x.constipation}.inject(0, :+)
		top_hash["diarrhea"] = top.map{|x| x.diarrhea}.inject(0, :+)
		top_hash["bloating"] = top.map{|x| x.bloating}.inject(0, :+)

		bottom_hash = Hash.new()
		bottom_hash["abdominal_pain"] = bottom.map{|x| x.abdominal_pain}.inject(0, :+)
		bottom_hash["constipation"] = bottom.map{|x| x.constipation}.inject(0, :+)
		bottom_hash["diarrhea"] = bottom.map{|x| x.diarrhea}.inject(0, :+)
		bottom_hash["bloating"] = bottom.map{|x| x.bloating}.inject(0, :+)

		render :json => {:top => top_hash.to_json, :bottom => bottom_hash.to_json}, :status => 200
	end
end
