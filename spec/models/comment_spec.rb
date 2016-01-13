require 'rails_helper'

describe Comment do
  
  describe "structure" do 
    let(:user) { User.find_or_create_by(email: "something@somewhere.com", name: "jack")}
    let(:deploy) { create :deploy }
    
    it do 
      expect(Comment.new(user: user, comment: "some comment").valid?).to be false
    end
    
    it do 
      expect(Comment.new(deploy: deploy, comment: "some comment").valid?).to be false
    end
    
    it do 
      expect(Comment.new(deploy: deploy, user: user).valid?).to be false
    end
  end
  
end
