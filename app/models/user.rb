class User < ActiveRecord::Base
  
  #=> User(id: integer, login: string, password: string, name: string, job: string, 
  #         job_hours: integer, created_at: datetime, updated_at: datetime, cash: integer)
  
 
  has_many :real_estates
  has_many :bought_stocks
  has_many :stocks, :through => :bought_stocks
  
  JOB_TYPES = %w(high middle low)
  
  PAY_RATES = {"high" => 35, "middle" => 22, "low" => 10}
  
  validates_inclusion_of :job, :in => JOB_TYPES

  validates_inclusion_of :job_hours, :in => 0..12, :if => :is_upper_class_job?
  validates_inclusion_of :job_hours, :in => 0..10, :if => :is_middle_class_job?
  validates_inclusion_of :job_hours, :in => 0..8, :if => :is_lower_class_job?
  
  validates_format_of :name, :with => /^[0-9a-z_ \-\.]{3,20}$/i
  
  validates_format_of :login, :with => /^[0-9a-z]{3,15}$/i
  validates_uniqueness_of :login
  
  validates_format_of :password, :with => /^[0-9a-z]{6,20}$/i
  
  def payrate
    PAY_RATES[job]
  end
  
  def is_upper_class_job?
    job=="high"
  end
   
  def is_middle_class_job?
    job=="middle"
  end
  
  def is_lower_class_job?
    job=="low"
  end
  
  def cashflow
    monthly_job_cashflow+monthly_real_estate_cashflow
  end
 
  def monthly_job_cashflow #currently assumes 22 working days per month
    job_hours*payrate*(22)
  end
  
  def monthly_real_estate_cashflow
    real_estates.inject(0) {|houseincome,x| houseincome + x.total_rent}
  end
 
  def net_stock_value
    bought_stocks.inject(0) {|stockvalue,x| stockvalue + x.current_value}
  end
  
  def net_real_estate_value
    real_estates.inject(0) {|housecost,x| housecost + x.cost}
  end
  
end
