class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :deploy

  validates :body, presence: true
end