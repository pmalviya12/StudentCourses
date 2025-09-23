class CreateDemos < ActiveRecord::Migration[8.0]
  def change
    create_table :demos do |t|
      t.string :name
      t.string :desp

      t.timestamps
    end
  end
end
