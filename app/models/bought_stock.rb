class BoughtStock < ActiveRecord::Base
  #DO VALIDATIONS KIRK!!
  belongs_to :user
  belongs_to :stock
end
