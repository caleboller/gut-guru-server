class Api::V1::FoodEntriesController < ApplicationController

	def create
		current_user.food_entries << FoodEntry.create!(params[:food_entry])
		render :json => {:success => true}, :status => 200
	end

end
