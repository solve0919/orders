class AddColumnToContractor < ActiveRecord::Migration[5.2]
  def change
    add_column :contractors, :category_id, :integer
  end
end
