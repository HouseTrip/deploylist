class Comment < ActiveRecord::Base
  belongs_to :deploy
  belongs_to :user

  scope :by_most_recent, -> { order(created_at: 'DESC') }
end
