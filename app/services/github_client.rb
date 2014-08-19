module GithubClient
  private

  def client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN'))
  end
end
