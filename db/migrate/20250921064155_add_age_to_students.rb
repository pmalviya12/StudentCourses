class AddAgeToStudents < ActiveRecord::Migration[8.0]
  def change
    add_column :students, :age, :integer, comment: "Students age is saved"
  end
end
