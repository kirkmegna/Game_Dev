class MakeNewHouse
  def perform
    too_many = RealEstate.unowned.count >=10
    RealEstate.new_house unless too_many
    Delayed::Job.enqueue MakeNewHouse.new, 0, 30.seconds.from_now
  end
end