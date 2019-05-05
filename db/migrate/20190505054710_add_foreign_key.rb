class AddForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :requests, :contractors
    add_foreign_key :contractors, :users
    add_foreign_key :orders, :users
  end
end
