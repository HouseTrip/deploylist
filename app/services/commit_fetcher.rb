class CommitFetcher
  include GithubClient

  def initialize(deploy, previous_deploy)
    @deploy, @previous_deploy = deploy, previous_deploy
  end

  def call
    comparrison.commits.each do |commit|
      StoryImporter.new(deploy, commit).import
    end
  end

  private

  attr_reader :deploy, :previous_deploy

  def comparrison
    client.compare(repo, previous_deploy.sha, deploy.sha)
  rescue Octokit::NotFound
    puts "   (deploy skipped - unable to find one of the commits to compare with)"
    return OpenStruct.new(commits: [])
  end
end
