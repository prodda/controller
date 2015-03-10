class Task < ActiveRecord::Base
  validates :schedule, presence: true
  validates :type, presence: true
end
