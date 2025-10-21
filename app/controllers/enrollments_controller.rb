class EnrollmentsController < ApplicationController
  before_action :set_student

  def new
    # Available courses = those student is NOT already enrolled in
    @available_courses = Course.all - @student.courses

    # If no courses left or max 3 reached
    if @available_courses.empty? || @student.courses.count >= 3
      flash[:notice] = "No courses available for enrollment or Max courses reached"
      redirect_to student_path(@student)
    else
      @enrollment = Enrollment.new
    end
  end

  def create
    course_id = params[:enrollment][:course_id]
    @course = Course.find(course_id)

    # Validations
    if @student.courses.include?(@course)
      flash[:alert] = "Student already enrolled in this course"
    elsif @student.courses.count >= 3
      flash[:alert] = "Student cannot enroll in more than 3 courses"
    else
      Enrollment.create(student: @student, course: @course)
      flash[:notice] = "Student is enrolled successfully"
    end

    redirect_to student_path(@student)
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end
end
