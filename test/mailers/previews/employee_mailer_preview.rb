# Preview all emails at http://localhost:3000/rails/mailers/employee_mailer
class EmployeeMailerPreview < ActionMailer::Preview
  def registration_confirmation
    # Set up a temporary order for the preview
    employee = Employee.new(name: "Joe Smith", email: "joe@gmail.com", address: "1-2-3 Chuo, Tokyo, 333-0000")

    EmployeeMailer.with(employee: employee).registration_confirmation
  end
end
