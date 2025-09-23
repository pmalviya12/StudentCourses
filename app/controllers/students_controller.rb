class StudentsController < ApplicationController
  before_action :set_student , only: %i[show edit update destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: "Student has been created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: "Student is update successfully"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  private 

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :local_address, :permanent_adress, :permanent_contact_number, :alternate_contact_number, :state, :age)
  end
end
