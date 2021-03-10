class EmployeesController < ApplicationController
  
  def index
    
    order = params[:order]
    order = "ASC" unless order
      
    if params[:order]
  	  @employees = Employee.search(params[:search]).paginate(page: params[:page], per_page:5).order("name #{order}")
  
    elsif params[:order] and params[:page]
      @employees = Employee.search(params[:search]).paginate(page: params[:page], per_page:5).order("updated_at DESC")
    
    else
      @employees = Employee.all.paginate(page: params[:page],per_page:5).order("updated_at DESC")
      
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
  	puts "Data:#{params}"
  	@employee = Employee.new(employee_params)

  	if @employee.save
  		puts "Successfully saved!"
  		redirect_to @employee
  	else
  		puts "Failed!!! not saved"
  		render :new
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
  	  params.require(:employee).permit(:name, :gender, :dob, :address, :department, :doj,:emp_id,:image)
  	end


end
  