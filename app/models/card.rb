class Card < ApplicationRecord
  belongs_to :worker
  validates :day, :uniqueness => { :scope=>:worker_id }, :presence => true
  validates :worktime, :presence => true
end
