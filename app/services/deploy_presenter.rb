class DeployPresenter < SimpleDelegator

  def name
    user.try(:fetch, :name) || model.username
  end

  def username
    user.try(:fetch, :username) || model.username
  end

  def user_link
    "https://github.com/#{username}"
  end

  private

  def user
    USERS_MAP[model.username.to_sym]
  end

  def model
    __getobj__
  end
end
