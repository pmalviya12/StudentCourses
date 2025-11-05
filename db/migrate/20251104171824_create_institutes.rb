class CreateInstitutes < ActiveRecord::Migration[8.0]
  def change
    create_table :institutes do |t|
      t.string :name
      t.integer :code
      t.text :description

      t.timestamps
    end
  end
end
