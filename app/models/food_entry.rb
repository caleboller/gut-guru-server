class FoodEntry < ActiveRecord::Base
	belongs_to :user

	attr_accessible :lactose, :gluten, :fat_g, :weight_g
end
