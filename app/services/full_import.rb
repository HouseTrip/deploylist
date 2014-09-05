class FullImport
  def self.call(limit: 100, stream: $stdout)
    @logger = DeployLogger.new(stream)
    @logger.log("Fetching deploy information...")

    DeployFetcher.new(@logger).call

    @deploys = Deploy.production.limit(limit)

    @deploys.each_with_index do |deploy, index|
      @logger.log("Reviewing deploy: #{deploy.sha}")
      previous_deploy = @deploys[index+1]

      next if deploy == previous_deploy

      next unless (deploy && deploy.sha) && (previous_deploy && previous_deploy.sha)

      CommitFetcher.new(deploy, previous_deploy).call
    end

    @logger.log("Reviewing stories", newline: false)
    Story.without_title.with_pull_requests.each do |story|
      @logger.log(".", newline: false)
      PullRequestFetcher.new(story).call
    end

    @logger.log(".")
    @logger.log("Done.")
  end
end
