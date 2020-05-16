class Worker < ApplicationRecord
  belongs_to :department
  has_many :cards
  enum way_of_payment: [:per_hour, :full_time]
  
  def full_name
    self.name + ' ' + self.surname
  end

  def current_salary
    self.per_hour? ?  SalaryCounter.new.count(self)|| 0 : self.salary
  end

  def work_time
    self.cards.where('DAY BETWEEN ? AND ?',
                        Date.current.beginning_of_month,
                        Date.current.end_of_month)
                .pluck(:worktime)
                .inject(0, :+)
  end

end
