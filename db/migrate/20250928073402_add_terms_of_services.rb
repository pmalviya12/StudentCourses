class AddTermsOfServices < ActiveRecord::Migration[8.0]
  def change
    add_column :demos, :terms_of_services, :boolean, default: false
  end
end
