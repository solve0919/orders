class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :order, foreign_key: true
      t.integer :contractor_id
      t.integer :money
      t.string :delivery
      t.string :quantity
      t.text :hope
      t.text :note
      t.string :receive
      t.string :adress
      t.string :payment
      t.integer :status

      t.timestamps
    end
  end
end
