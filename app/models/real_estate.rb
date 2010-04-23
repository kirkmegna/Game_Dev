class RealEstate < ActiveRecord::Base
  named_scope :unowned, :conditions => "user_id is null"
#=> RealEstate(id: integer, user_id: integer, style: string, cashflow: integer, created_at: datetime, updated_at: datetime, cost: integer)

  belongs_to :user
  
   # styles:
  HOUSE_TYPES = %w(3Br/2Ba 2Br/1Ba Duplex 4-plex 8-plex)
   
  COST = {
    "2Br/1Ba" => (40000..65000), 
    "3Br/2Ba" => (65000..85000), 
    "Duplex" => (85000..105000), 
    "4-plex" => (105000..135000), 
    "8-plex" => (135000..170000)
  }
  
  CASHFLOW = {
    "2Br/1Ba" => (-100..150), 
    "3Br/2Ba" => (-100..200), 
    "Duplex" => (-100..300), 
    "4-plex" => (-150..600), 
    "8-plex" => (-300..1200)
  }
      
   validates_inclusion_of :style, :in => HOUSE_TYPES
 
   validates_inclusion_of :cashflow, :in => -100..150, :if => :is_2br_1ba?
   validates_inclusion_of :cashflow, :in => -100..200, :if => :is_3br_2ba?
   validates_inclusion_of :cashflow, :in => -100..300, :if => :is_duplex?
   validates_inclusion_of :cashflow, :in => -150..600, :if => :is_4_plex?
   validates_inclusion_of :cashflow, :in => -300..1200, :if => :is_8_plex?
   
   validates_inclusion_of :cost, :in => 40000..65000, :if => :is_2br_1ba?
   validates_inclusion_of :cost, :in => 65000..85000, :if => :is_3br_2ba?
   validates_inclusion_of :cost, :in => 85000..105000, :if => :is_duplex?
   validates_inclusion_of :cost, :in => 105000..135000, :if => :is_4_plex?
   validates_inclusion_of :cost, :in => 135000..170000, :if => :is_8_plex?
   
   def self.new_house
     style=HOUSE_TYPES.rand
     cost=rand(COST[style].last-COST[style].first)+COST[style].first
     cashflow=rand(CASHFLOW[style].last+CASHFLOW[style].first)-CASHFLOW[style].first
     RealEstate.create(:style => style, :cost => cost, :cashflow => cashflow)
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
