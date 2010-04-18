class User < ActiveRecord::Base
  JOB_TYPES = %w(high middle low)
  
  validates_inclusion_of :job, :in => JOB_TYPES

  validates_inclusion_of :job_hours, :in => 0..12, :if => :is_upper_class_job?
  validates_inclusion_of :job_hours, :in => 0..10, :if => :is_middle_class_job?
  validates_inclusion_of :job_hours, :in => 0..8, :if => :is_lower_class_job?
  
  validates_format_of :name, :with => /^[0-9a-z _-\.]{3,10}$/i
  
  validates_format_of :login, :with => /^[0-9a-z]{3,15}$/i
  validates_uniqueness_of :login
  
  validates_format_of :password, :with => /^[0-9a-z]{6,20}$/i
 
  
  
  
  def is_upper_class_job?
    job=="high"
  end
  
  def is_middle_class_job?
    job=="middle"
  end
  
  def is_lower_class_job?
    job=="low"
  end
  
  
end
