class CreateContractorCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :contractor_categories do |t|
      t.integer :contractor_id
      t.integer :category_id

      t.timestamps
    end
  end
end
