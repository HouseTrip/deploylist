class FullImport
  def self.call(limit: 100, stream: $stdout)
    log("Fetching deploy information...", stream)

    DeployFetcher.new.call

    @deploys = Deploy.production.limit(limit)

    @deploys.each_with_index do |deploy, index|
      log("Reviewing deploy: #{deploy.sha}", stream)
      previous_deploy = @deploys[index+1]

      next if deploy == previous_deploy

      next unless (deploy && deploy.sha) && (previous_deploy && previous_deploy.sha)

      CommitFetcher.new(deploy, previous_deploy).call
    end

    Story.without_title.with_pull_requests.each do |story|
      log("Reviewing story: ##{story.pivotal_uid}", stream)
      PullRequestFetcher.new(story).call
    end

    log("Done.", stream)
  end

  private

  def self.log(text, stream)
    return unless stream
    stream.write(text + "\n")
  end
end
