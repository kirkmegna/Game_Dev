class BoughtStock < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :stock
  
  #=> BoughtStock(id: integer, user_id: integer, stock_id: integer, quantity: integer, created_at: datetime, updated_at: datetime)
  
  validates_numericality_of :quantity, :greater_than_or_equal_to => 0
  
  validates_presence_of :user_id
  
  #validates_presence_of :stock_id -> Should this be here? Will it cause a problem is someone hasn't bought a stock yet?
  
  def current_value
    stock.value*quantity # Gives us the current worth of the stocks owned.
  end
   
end
