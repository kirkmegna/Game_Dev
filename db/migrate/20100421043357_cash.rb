class Cash < ActiveRecord::Migration
  def self.up
    add_column :users, :cash, :integer
  end

  def self.down
    remove_column :users, :cash
  end
end
