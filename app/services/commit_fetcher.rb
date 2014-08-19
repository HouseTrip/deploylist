class CommitFetcher
  include GithubClient

  def initialize(deploy, previous_deploy)
    @deploy, @previous_deploy = deploy, previous_deploy
  end

  def run
    comparrison.commits.each do |commit|
      StoryImporter.new(deploy, commit).import
    end
  end

  private

  attr_reader :deploy, :previous_deploy

  def comparrison
    client.compare(
      'HouseTrip/HouseTrip-Web-App',
      previous_deploy.sha,
      deploy.sha
    )
  end
end
