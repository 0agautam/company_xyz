class Employee < ApplicationRecord
	validates :name, presence: true, length: {minimum: 3}
	validates :gender, presence: true
	validates :dob, presence: true
	validates :address, presence: true
	validates :department, presence: true
	validates :doj, presence: true
end
