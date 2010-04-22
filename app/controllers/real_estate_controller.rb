class RealEstateController < ApplicationController
  
  include SessionHelper

  def index
    @real_estate =  current_user.real_estates.all
    @home = RealEstate.find_all_by_user_id(nil)
  end
 
  def buy
  
    @buy = RealEstate.find_by_user_id_and_id(nil, params[:id])
    if not @buy
      flash[:note] = "Too slow! It just sold!"
      redirect_to :action => 'index"'
      return
    end
    if current_user.cash < @buy.cost
     flash[:note] = "You are BROKE!"
     redirect_to :action => "index"
     return
    end
    current_user.cash -= @buy.cost
    @buy.user_id = current_user
    current_user.save
    @buy.save
    redirect_to :action => "index"
  end
  
  def sell
    @sell = RealEstate.find_by_user_id_and_id(current_user.id, params[:id])
    if @sell == nil 
      flash[:note] = "HAXXXXXX!!!"
      redirect_to :action => "index"
      return
    end
    current_user.cash += @sell.cost
    @sell.delete
    current_user.save
    @sell.save
    redirect_to :action => "index"
    
  end

end
