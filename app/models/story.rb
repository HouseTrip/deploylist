class Story < ActiveRecord::Base
  belongs_to :deploy

  validates :message, :date, :deploy, presence: true

  scope :without_title, -> { where('title IS NULL') }
  scope :with_pull_requests, -> { where('pull_request_uid IS NOT NULL') }
end
