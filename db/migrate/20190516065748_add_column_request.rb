class AddColumnRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests , :judge , :integer
  end
end
