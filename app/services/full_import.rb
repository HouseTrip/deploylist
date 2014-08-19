class FullImport
  def self.run
    DeployFetcher.new.run

    @deploys = Deploy.all.order('time DESC')

    @deploys.each_with_index do |deploy, index|
      previous_deploy = @deploys[index+1]

      next if deploy == previous_deploy

      next unless (deploy && deploy.sha) && (previous_deploy && previous_deploy.sha)

      CommitFetcher.new(deploy, previous_deploy).run
    end
  end
end
