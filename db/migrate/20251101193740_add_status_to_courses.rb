class AddStatusToCourses < ActiveRecord::Migration[8.0]
  def change
    add_column :courses, :status, :integer
  end
end
