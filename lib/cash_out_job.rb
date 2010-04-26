class CashOutJob
  def perform
    User.all.each do |user|
      user.cash += user.cashflow
      user.save
    end
   Delayed::Job.enqueue CashOutJob.new, 0, 2.hours.from_now
  end
end