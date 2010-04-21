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
    @stock = Stock.find(params[:id])
    @sell = BoughtStock.find(@stock.id)
    if @sell.quantity <= 0
      flash[:note] = "No more stocks to sell!"
      redirect_to :action => "index"
      return
    end
    current_user.cash += @stock.value
    @sell.quantity = @sell.quantity-1
    current_user.save
    @sell.save
    redirect_to :action => "index"
    
  end

end
