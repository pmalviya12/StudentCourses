class RenameAgeColumnFromStudent < ActiveRecord::Migration[8.0]
  def change
    remove_column :students, :age, :integer
    add_column :students, :date_of_birth, :date
  end
end
