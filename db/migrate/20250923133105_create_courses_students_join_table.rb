class CreateCoursesStudentsJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :courses, :students
  end
end
