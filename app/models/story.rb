class Story < ActiveRecord::Base
  belongs_to :deploy

  validates :message, :date, :deploy, presence: true
end
