class Stock < ActiveRecord::Base
  #DO VALIDATIONS KIRK!!
  has_many :bought_stocks
  has_many :users, :through => :bought_stocks
end
