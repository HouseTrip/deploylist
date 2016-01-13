class Comment < ActiveRecord::Base
  belongs_to :deploy
  belongs_to :user
  
  validates_presence_of :deploy, :on => :create, :message => "can't be blank"
  validates_presence_of :user, :on => :create, :message => "can't be blank"
  # and has a comment (text)
end
