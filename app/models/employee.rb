class Employee < ApplicationRecord
	validates :name, presence: true, length: {minimum: 3}
	validates :gender, presence: true, length:{minimum:1}
	validates :dob, presence: true, length:{minimum:1}
	validates :address, presence: true, length:{minimum:2}
	validates :department, presence: true, length:{minimum:2}
	validates :doj, presence: true, length:{minimum:2}
	#has_many : equipment, dependent: :destroy
end
