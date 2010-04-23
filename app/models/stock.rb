class Stock < ActiveRecord::Base
  
  has_many :bought_stocks
  has_many :users, :through => :bought_stocks

  # 1 = AWSUM Enterprises
  # 2 = MNY4U Record Label
  # 3 = BGAPL Liberty Foods
  # 4 = SKYHI Construction Company
  
  #=> Stock(id: integer, name: string, created_at: datetime, updated_at: datetime, value: decimal)
 
  validates_numericality_of :value, :greater_than => 0
  
  validates_format_of :name, :with => /^[0-9a-z ]{8,30}$/i
  
end
