class Deploy < ActiveRecord::Base
  scope :production, -> { where(environment: 'production') }

  def short_ref
    revision ? revision[0, 7] : ""
  end
end
