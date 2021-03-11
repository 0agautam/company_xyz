class Employee < ApplicationRecord
	#attr_accessible :address
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
  
  mount_uploader :image , ImageUploader


  def self.search(search)
    if search 
      Employee.where("name ilike ?", "%#{search}%")
    else
      Employee.all
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header,spreadsheet.row(i)].transpose]

    #using direct csv 
    #CSV.foreach(file.path, headers: true) do |row|
      
      emp = Employee.find_by(emp_id:row["emp_id"])
      #code to understand
        # employee = find_by_id(row["id"]) || new
        # employee.attributes = row.to_hash.slice(*attr_accessor)
        # employee.save!

      if !emp
        #puts "Empid: #{emp.emp_id}"
        Employee.create! row.to_hash
      else
        puts "Record already exists:#{row["emp_id"]}"
      end
    end
  end

  def self.open_spreadsheet(file)
    puts "File name is: #{file}"
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    when ".xls" then  Roo::Excel.new(file.path, nil, :ignore) 
    when ".ods" then  Roo::OpenOffice.new(file.path) 
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |employee|
        csv << employee.attributes.values_at(*column_names)
      end
    end
  end

end
