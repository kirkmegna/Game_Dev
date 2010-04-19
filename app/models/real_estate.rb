class RealEstate < ActiveRecord::Base
  
#=> RealEstate(id: integer, user_id: integer, style: string, cashflow: integer, number_owned: integer, created_at: datetime, updated_at: datetime)

  belongs_to :user
  
  def total_cashflow
    number_owned*cashflow #need to edit this lots
  end
  
  #validate style
  #validate cashflow
  #validate the number owned
  
end
