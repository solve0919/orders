class AddJydgeToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :judge_contractor, :boolean
    rename_column :requests, :judge, :judge_order
    change_column :requests, :judge_order ,'boolean USING CAST(judge_order AS boolean)'
  end
end
