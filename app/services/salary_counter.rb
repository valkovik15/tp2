class SalaryCounter

  def count(worker)
    salary = worker.salary
    salary*( ( worker.cards.where('DAY BETWEEN ? AND ?',
                        Date.current.beginning_of_month,
                        Date.current.end_of_month)
                .pluck(:worktime)
                .inject { |sum, time| sum+(time+0.5*[time-8, 0].max) } ) || 0)
  end

  def send_salary
    Woker.all.each do |worker|
      p "#{worker.full_name}: #{count(worker)}"
    end
  end
end
