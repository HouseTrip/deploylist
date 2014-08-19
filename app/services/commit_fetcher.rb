class CommitFetcher

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

  def client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN'))
  end
end
