class AddAddressToStudents < ActiveRecord::Migration[8.0]
  def change
    add_column :students, :address, :string
  end
end
