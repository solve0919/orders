class RemovecategoryIdFromContractors < ActiveRecord::Migration[5.2]
  def change
    remove_column :contractors, :category_id, :integer

  end
end
