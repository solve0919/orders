class RemoveContractorIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :contractor_id, :integer
  end
end
