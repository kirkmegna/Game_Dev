class RemoveNumOwned < ActiveRecord::Migration
  def self.up
    remove_column :real_estates, :number_owned
  end

  def self.down
    add_column :real_estates, :number_owned, :integer
  end
end
