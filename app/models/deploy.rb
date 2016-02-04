class Deploy < ActiveRecord::Base
  has_many :stories, dependent: :destroy

  validates :uid, :sha, :username, :environment, :time, presence: true
  validates_uniqueness_of :uid

  scope :production, -> { where(environment: 'production') }
  scope :filter_by_date_range, lambda { |lower_bound, upper_bound|
    fail "Nil date" unless lower_bound && upper_bound
    where('time between ? and ?', lower_bound, upper_bound)
  }

  default_scope { order('time DESC') }

  def short_ref
    sha ? sha[0, 7] : ""
  end
end
