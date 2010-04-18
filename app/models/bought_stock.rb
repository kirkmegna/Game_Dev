class BoughtStock < ActiveRecord::Base
  #DO VALIDATIONS KIRK!!
  belongs_to :user
  belongs_to :stock
  
  def current_value
    stock.value*quantity
  end
  
end
