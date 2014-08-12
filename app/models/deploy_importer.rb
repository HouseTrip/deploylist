class DeployImporter
  def self.import(deploys)
    deploys.map do |deploy|
      next if deploy['environment'] != 'production'

      Deploy.find_or_initialize_by(uid: deploy['id'].to_s).tap do |d|
        d.time = deploy['created_at']
        d.sha = deploy['revision']
        d.repository = deploy['repository']
        d.username = deploy['local_username']
        d.project_uid = deploy['project_id']
        d.environment = deploy['environment']

        d.save
      end
    end
  end
end
