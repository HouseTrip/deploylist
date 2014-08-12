class Commit < ActiveRecord::Base
  belongs_to :deploy

  validates :message, :sha, :date, :deploy, presence: true
end
