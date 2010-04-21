class RealEstateController < ApplicationController
  
  include SessionHelper

  def index
    @real_estate =  current_user.real_estates.all
    @home = RealEstate.new_house 
  end
 
  def buy
    @buy = RealEstate.find_by_user_id(nil)
    if current_user.cash < @buy.cost
     flash[:note] = "You are BROKE!"
     RealEstate.find_by_user_id(nil).delete
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
    @sell = RealEstate.find(params[:id])
    if @sell.id == nil
      flash[:note] = "No more real estate to sell!"
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
