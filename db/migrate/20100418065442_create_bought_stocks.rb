class CreateBoughtStocks < ActiveRecord::Migration
  def self.up
    create_table :bought_stocks do |t|
      t.integer :user_id
      t.integer :stock_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :bought_stocks
  end
end
