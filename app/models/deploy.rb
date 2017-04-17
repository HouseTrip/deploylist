class Deploy < ActiveRecord::Base
  has_many :stories, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :uid, :sha, :username, :environment, :time, presence: true
  validates_uniqueness_of :uid

  scope :production, -> { where(environment: 'production') }

  default_scope { order('time DESC') }

  def short_ref
    sha ? sha[0, 7] : ""
  end
end
