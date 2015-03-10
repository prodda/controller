class AddSleepDurationAndTypeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :sleep_duration, :string
    add_column :tasks, :type, :string
  end
end
