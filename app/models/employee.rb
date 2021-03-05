class Employee < ApplicationRecord
	# validates :name, presence: true, length: {minimum: 3}
	# validates :gender, presence: true, length:{minimum:1}
	# validates :dob, presence: true, length:{minimum:1}
	# validates :address, presence: true, length:{minimum:2}
	# validates :department, presence: true, length:{minimum:2}
	# validates :doj, presence: true, length:{minimum:2}
	# validates :emp_id, presence: true, length: {minimum:5}
	#has_many :myequipments, dependent: :destroy
	has_many :laptops, dependent: :destroy
	has_many :accounts

  def self.search(search)
    if search 
      found_employees = Employee.where("name ilike ?", "%#{search}%")

      if found_employees
        self.where(id: found_employees)
 
      else
        @employees = Employee.all
      end
    else
      @employees = Employee.all
    end
  end
end
