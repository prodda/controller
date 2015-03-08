class Task < ActiveRecord::Base
  validates :schedule, presence: true
end
