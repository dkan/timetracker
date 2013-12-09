class AddHoursToWorkSession < ActiveRecord::Migration
  def change
    add_column :work_sessions, :hours, :decimal, precision: 6, scale: 4
  end
end
