class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :food_entries
  has_many :symptom_measurements

  def top_symptom_measurements
  	count = self.symptom_measurements.count
  	portion = count * 0.25
  	if portion < 1 
  		portion = 1
  	end
  	measurements = SymptomMeasurement.order("composite_score DESC").limit(portion)
  end

  def bottom_symptom_measurements
  	count = self.symptom_measurements.count
  	portion = count * 0.25
  	if portion < 1 
  		portion = 1
  	end
  	measurements = SymptomMeasurement.order("composite_score ASC").limit(portion)
  end

end
