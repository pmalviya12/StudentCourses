class ChangeDemoAttr < ActiveRecord::Migration[8.0]
    def up
      change_column :demos, :desp, :text
    end

    def down 
      change_column :demos, :desp, :string
    end
end