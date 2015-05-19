class PullRequestFetcher
  include GithubClient

  def initialize(story)
    @story = story
  end

  def call
    title = TitleCleaner.call(pull_request[:title])
    return false unless title.present?

    story.update_attributes(title: title)
  end

  private

  attr_reader :story

  def pull_request
    client.pull_request(repo, story.pull_request_uid)
  end
end
