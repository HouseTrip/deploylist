class Deploy < ActiveRecord::Base
  has_many :commits, dependent: :destroy

  validates :uid, :sha, :username, :environment, :time, presence: true

  scope :production, -> { where(environment: 'production') }

  def short_ref
    sha ? sha[0, 7] : ""
  end
end
