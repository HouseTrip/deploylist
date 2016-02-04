class DeploySearch
  include ActiveModel::Model

  attr_accessor :lower_bound_date, :upper_bound_date

  validates :lower_bound_date, :upper_bound_date, presence: true
end
