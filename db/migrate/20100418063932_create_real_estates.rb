class CreateRealEstates < ActiveRecord::Migration
  def self.up
    create_table :real_estates do |t|
      t.integer :user_id
      t.string :style
      t.integer :cashflow
      t.integer :number_owned

      t.timestamps
    end
  end

  def self.down
    drop_table :real_estates
  end
end
