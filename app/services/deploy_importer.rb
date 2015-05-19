class DeployImporter
  def self.import(deploys)
    deploys.map do |deploy|
      # time when the deploy script was fixed to send the right sha to honeybadger
      next if ENV['DEPLOYS_FROM'] && deploy['created_at'] <= Time.parse(ENV['DEPLOYS_FROM'])
      next if deploy['environment'] != 'production'

      # need to generate a unique id for this deploy, use env and created_at date
      uid = Digest::SHA1.hexdigest("#{deploy['environment']}-#{deploy['created_at']}")

      Deploy.find_or_initialize_by(uid: uid).tap do |d|
        d.time        = deploy['created_at']
        d.sha         = deploy['revision']
        d.repository  = deploy['repository']
        d.username    = deploy['local_username']
        d.environment = deploy['environment']
        d.project_uid = ENV['HONEYBADGER_PROJECT_ID']

        d.save
      end
    end
  end
end
