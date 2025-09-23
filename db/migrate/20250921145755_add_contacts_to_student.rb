class AddContactsToStudent < ActiveRecord::Migration[8.0]
  def change
    add_column :students, :permanent_contact_number, :integer
    add_column :students, :alternate_contact_number, :integer
  end
end
