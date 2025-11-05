class RemoveAddressColumnFormStudents < ActiveRecord::Migration[8.0]
  def change
    remove_column :students, :local_address, :string
    remove_column :students, :permanent_adress, :string
  end
end
