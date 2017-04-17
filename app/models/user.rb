class User < ActiveRecord::Base
  has_many :comments
  
  devise :omniauthable, :omniauth_providers => [ :google_oauth2 ]

  def self.find_for_google_oauth2(auth, signed_in_resource=nil)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email    = auth.info.email
      user.name     = auth.info.name
    end
  end
end
