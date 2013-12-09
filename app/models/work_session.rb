class WorkSession < ActiveRecord::Base
  validates_presence_of :project_id

  belongs_to :user
  belongs_to :project
end
