class CreateWorkSessions < ActiveRecord::Migration
  def change
    create_table :work_sessions do |t|
      t.datetime :finish
      t.integer :project_id

      t.timestamps
    end
  end
end
