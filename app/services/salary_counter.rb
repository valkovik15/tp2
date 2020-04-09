class SalaryCounter
  attr_accessor :worker

  def initialize(worker)
    @worker = worker
  end

  def count
    salary = worker.salary
    salary*worker.cards.where('DAY BETWEEN ? AND ?',
                        Date.current.beginning_of_month,
                        Date.current.end_of_month)
                .pluck(:worktime)
                .inject { |sum, time| sum+(time+0.5*[time-8, 0].max) }
  end
end
