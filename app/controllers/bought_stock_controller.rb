class BoughtStockController < ApplicationController
  
  include SessionHelper

  def index
    @stocks = Stock.all
  end
  
  def buy
   @stock = Stock.find(params[:id])
   if current_user.cash < @stock.value
     flash[:note] = "You are BROKE!"
     redirect_to :action => "index"
     return     
   end
   current_user.cash -= @stock.value
   @buy = BoughtStock.find_or_create_by_user_id_and_stock_id (current_user.id, @stock.id)
   @buy.quantity = (@buy.quantity || 0)+1
   current_user.save
   @buy.save
   redirect_to :action => "index"
  end
  
  def sell
    
  end

end
