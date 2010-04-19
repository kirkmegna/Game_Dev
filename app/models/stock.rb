class Stock < ActiveRecord::Base
  
  has_many :bought_stocks
  has_many :users, :through => :bought_stocks

  # 1 = AWSUM Enterprises
  # 2 = MNY4U Record Label
  # 3 = BGAPL Liberty Foods
  # 4 = SKYHI Construction Company
  
  #=> Stock(id: integer, name: string, value: integer, created_at: datetime, updated_at: datetime)
 
  validates_inclusion_of :value, :in => 1..150 
  validates_format_of :value, :with => /^[0-9]{1,3}$/
  
  validates_format_of :name, :with => /^[0-9a-z ]{8,30}$/i
  
end
