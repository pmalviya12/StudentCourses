class AddAddressToStudent < ActiveRecord::Migration[8.0]
  def change
    add_column :students, :local_address, :string
    add_column :students, :permanent_adress, :string
  end
end
