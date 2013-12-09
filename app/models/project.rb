class Project < ActiveRecord::Base
  validates_presence_of :name, :rate, :user_id

  belongs_to :user
  has_many :work_sessions
end
