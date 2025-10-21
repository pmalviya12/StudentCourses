class StudentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  #controller_callbacks
  before_action :set_student , only: %i[show edit update destroy]
  skip_before_action :display_message, only: [:index]

  helper_method :formatted_date

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      CrudNotificationMailer.create_notification(@student)
      deliver_now
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
      #explicit rendering
      render :edit
    end
  end

  def show
    #here we are having implicit redering
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

  def record_not_found
    render plain: "Student Not Found", status: :not_found
  end

  def formatted_date(date)
    date.strftime('%A, %b %d, %Y') if date.present?
  end
end
