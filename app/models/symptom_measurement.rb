class SymptomMeasurement < ActiveRecord::Base
	belongs_to :user

	def suspect_food_entries_for_user user
		FoodEntry.find(:all, :conditions => ["created_at >= ? AND user_id == ?", 4.hours.ago, user.id])
	end

	def composite_score
		self.abdominal_pain + self.bloating + self.constipation + self.diarrhea
	end

end
