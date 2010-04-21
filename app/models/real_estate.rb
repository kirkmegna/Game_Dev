class RealEstate < ActiveRecord::Base
  
#=> RealEstate(id: integer, user_id: integer, style: string, cashflow: integer, created_at: datetime, updated_at: datetime, cost: integer)

  belongs_to :user
  
   # styles:
   HOUSE_TYPES = %w(3Br/2Ba 2Br/1Ba Duplex 4-plex 8-plex)
   
   validates_numericality_of :cost, :greater_than_or_equal_to => 0
   
   validates_inclusion_of :style, :in => HOUSE_TYPES
   
   validates_presence_of :user_id
 
   validates_inclusion_of :cashflow, :in => -100..150, :if => :is_2br_1ba?
   validates_inclusion_of :cashflow, :in => -100..200, :if => :is_3br_2ba?
   validates_inclusion_of :cashflow, :in => -100..300, :if => :is_duplex?
   validates_inclusion_of :cashflow, :in => -150..600, :if => :is_4_plex?
   validates_inclusion_of :cashflow, :in => -300..1200, :if => :is_8_plex? 
   
   def self.random_house
     #Fill this out using random stuff blahblahblah
   end
   
   def total_rent
    cashflow 
   end
   
   def is_3br_2ba?
     style=="3Br/2Ba"
   end
   
   def is_2br_1ba?
     style=="2Br/1Ba"
   end
   
   def is_duplex?
     style=="Duplex"
   end
   
   def is_4_plex?
     style=="4-plex"
   end
   
   def is_8_plex?
     style=="8-plex"
   end
     
end
