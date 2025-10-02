class StudentNotificationService

  def self.send_student_deleted(student)
  	Rails.logger.info "Notifcation: Student with id #{student.id} is deleted."
  end
end