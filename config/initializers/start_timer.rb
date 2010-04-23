#clears jobs on server restart to avoid complicated pile-up of jobs
Delayed::Job.destroy_all

Delayed::Job.enqueue CashOutJob.new, 0, 30.seconds.from_now
Delayed::Job.enqueue MakeNewHouse.new, 0, 30.seconds.from_now

#start the time
#Thread.start { Delayed::Worker.new.start }