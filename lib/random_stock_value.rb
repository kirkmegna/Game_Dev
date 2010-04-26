class RandomStockValue
  def perform
    Stock.all.each do |stock|
      if rand < 0.25
        stock.value = stock.value + ((rand-0.5)*10).round(2)
        stock.save unless stock.value <= 0
      end
    end
   Delayed::Job.enqueue RandomStockValue.new, 0, 30.seconds.from_now
  end
end