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
end
