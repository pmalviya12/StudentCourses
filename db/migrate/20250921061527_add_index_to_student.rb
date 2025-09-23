class AddIndexToStudent < ActiveRecord::Migration[8.0]
  def change
    # add_index :students, :first_name, unique:  true
    # add_index :students, :last_name, unique: true
    add_index :students, [:first_name, :last_name], unique: true
  end
end
