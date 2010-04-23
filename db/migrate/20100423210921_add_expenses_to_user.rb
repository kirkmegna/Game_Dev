class AddExpensesToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :expenses, :integer
  end

  def self.down
    remove_column :users, :expenses
  end
end
