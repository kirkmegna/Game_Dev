class RemoveExpensesFromUser < ActiveRecord::Migration
  def self.up
     remove_column :users, :expenses
  end

  def self.down
     add_column :users, :expenses, :integer
  end
end
