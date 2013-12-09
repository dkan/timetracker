class AddAssociationsToProjectsAndWorkSessions < ActiveRecord::Migration
  def change
    add_column :projects, :user_id, :integer
    add_column :work_sessions, :user_id, :integer
  end
end
