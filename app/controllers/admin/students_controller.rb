class Admin::StudentsController < ApplicationController

  before_action :set_student , only: %i[show edit update destroy]
  skip_before_action :display_message, only: [:index]
  helper_method :formatted_date

  def index
    @students = Student.all.paginate(page: params[:page], per_page: 5)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      CrudNotificationMailer.create_notification(@student).deliver_now
      redirect_to admin_student_path(@student), notice: "Student has been created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
       CrudNotificationMailer.update_notification(@student).deliver_now
      redirect_to @student, notice: "Student is update successfully"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @student.destroy
    CrudNotificationMailer.delete_notification(@student).deliver_now
    redirect_to admin_students_path
  end

  private 

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :date_of_birth, :email, :local_address, :permanent_adress, :permanent_contact_number, :alternate_contact_number, :state, :age)
  end

  def record_not_found
    render plain: "Student Not Found", status: :not_found
  end

  def formatted_date(date)
    date.strftime('%A, %b %d, %Y') if date.present?
  end
end