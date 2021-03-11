class EmployeeMailer < ApplicationMailer
  default from: "sharmagaa76@gmail.com"

  def registration_confirmation(employee)
    @employee = employee
    puts "#{@employee}"
    @url  = 'http://example.com/login'
    #attachments["rails.png"] = File.read("#{Rails.root}/public/uploads/employee/image/23/slacker.jpg")
    mail(to: @employee.email, subject: "Registered")
  end
end
