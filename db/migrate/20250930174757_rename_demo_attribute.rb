class RenameDemoAttribute < ActiveRecord::Migration[8.0]
  def change
    rename_column :demos, :desp, :description
  end
end
