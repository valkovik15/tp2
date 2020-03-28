class SalaryCounter
  attr_accessor :worker

  def initialize(worker)
    @worker = worker
  end

  def count
    worker.cards.where('DAY BETWEEN ? AND ?',
                        Date.current.beginning_of_month,
                        Date.current.end_of_month)
                .pluck(:worktime)
                .inject {|sum, time| sum+time+0.5*max([time-8, 0])}
  end
end
