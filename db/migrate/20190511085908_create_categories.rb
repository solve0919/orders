class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :contractor_id
      t.integer :name

      t.timestamps
    end
  end
end
