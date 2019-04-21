class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :name
      t.string :postal_code
      t.string :prefectures
      t.string :ward
      t.string :address
      t.string :aparatment
      t.date :birthday
      t.string :settlement
      t.string :phone_number
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end
