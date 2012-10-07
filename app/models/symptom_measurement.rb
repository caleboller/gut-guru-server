class SymptomMeasurement < ActiveRecord::Base
	belongs_to :user

	attr_accessible :composite_score

	def suspect_food_entries_for_user user
		FoodEntry.find(:all, :conditions => ["created_at >= ? AND user_id == ?", 4.hours.ago, user.id.to_s])
	end

	def composite_score
		self.abdominal_pain + self.bloating + self.constipation + self.diarrhea
	end

end
