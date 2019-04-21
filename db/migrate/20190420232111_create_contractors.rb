class CreateContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :contractors do |t|
      t.integer :user_id
      t.string :name
      t.string :adress
      t.date :birthday
      t.string :prefectures
      t.string :phone_number
      t.text :description

      t.timestamps
    end
  end
end
