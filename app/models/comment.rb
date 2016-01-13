class Comment < ActiveRecord::Base
  belongs_to :deploy
  belongs_to :user
end
