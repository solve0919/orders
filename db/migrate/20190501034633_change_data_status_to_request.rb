class ChangeDataStatusToRequest < ActiveRecord::Migration[5.2]
  def change
    change_column :requests, :status, :integer
  end
end
