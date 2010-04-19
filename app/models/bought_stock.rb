class BoughtStock < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :stock
  
  #=> BoughtStock(id: integer, user_id: integer, stock_id: integer, quantity: integer, created_at: datetime, updated_at: datetime)
  
  validates_numericality_of :quantity, :greater_thank_or_equal_to => 0
  
  validates_presence_of :user_id
  
  validates_presence_of :stock_id
  
  def current_value
    stock.value*quantity
  end
   
end
