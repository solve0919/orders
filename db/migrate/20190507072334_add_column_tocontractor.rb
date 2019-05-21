class AddColumnTocontractor < ActiveRecord::Migration[5.2]
  def change
    add_column :contractors, :image, :string
  end
end
