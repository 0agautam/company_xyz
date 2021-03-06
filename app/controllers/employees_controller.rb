class EmployeesController < ApplicationController
  
  def index
    
    order = params[:order]
    order = "ASC" unless order
    page = 10
    puts "First employee id is : #{Employee.first.id.class}"
    if params[:order]
  	  @employees = Employee.search(params[:search]).paginate(page: params[:page], per_page:page).order("name #{order}")
  
    elsif params[:order] and params[:page]
      @employees = Employee.search(params[:search]).paginate(page: params[:page], per_page:page).order("updated_at DESC")
    
    else
      @employees = Employee.all.paginate(page: params[:page],per_page:page).order("updated_at DESC")

    end

    respond_to do |format|
      format.html
      format.csv { send_data @employees.to_csv }
      format.xls #{ send_data @employees.to_csv(col_sep: "\t") }
    end

  end

  def show
  	@employee = Employee.find(params[:id])
  end

  def new
  	puts "Into New"
  	@employee = Employee.new
  	puts "Out of new"
  	#render 'employee/new_employee'
  end

  def create
  	@employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        # Tell the UserMailer to send a welcome email after save
        # EmployeeMailer.with(employee: @employee).registration_confirmation.deliver_now
        EmployeeMailer.registration_confirmation(@employee).deliver
        
        puts "Successfully saved!"

        format.html { redirect_to(@employee, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        puts "Failed!!! not saved"

        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end 		
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to root_path
  end

  def delete_selected

    puts params
    
    Employee.where(:id => params[:employee_ids]).destroy_all

    redirect_to root_path
  end

  def import
    Employee.import(params[:file])
    redirect_to root_path, notice:"Employees Imported"
  end


  private
    def employee_params
  	  params.require(:employee).permit(:name, :gender, :dob, :address, :department, :doj,:emp_id, :email)
  	end


end
  