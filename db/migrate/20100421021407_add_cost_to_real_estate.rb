class AddCostToRealEstate < ActiveRecord::Migration
  def self.up
    add_column :real_estates, :cost, :integer
  end

  def self.down
    remove_column :real_estates, :cost 
  end
end
