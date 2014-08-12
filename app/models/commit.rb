class Commit < ActiveRecord::Base
  belongs_to :deploy

  validates :message, :sha, :author, :date, :deploy, presence: true
end
