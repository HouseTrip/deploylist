class Story < ActiveRecord::Base
  belongs_to :deploy

  validates :uid, :message, :date, :deploy, presence: true
end
