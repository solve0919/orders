class ChangeDatatypeDeliveryOfRequests < ActiveRecord::Migration[5.2]
  def change
    change_column :requests, :delivery, 'integer USING CAST(delivery AS integer)'
  end
end
