class CreateBlogs < ActiveRecord::Migration[8.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :content
      t.integer :student_id

      t.timestamps
    end
  end
end
