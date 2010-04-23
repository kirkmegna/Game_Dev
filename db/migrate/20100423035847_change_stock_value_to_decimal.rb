class ChangeStockValueToDecimal < ActiveRecord::Migration
  def self.up
    remove_column :stocks, :value
    add_column :stocks, :value, :decimal
  end

  def self.down
    add_column :stocks, :value, :decimal
    remove_column :stocks, :value
  end
end
