class StoryImporter
  def initialize(deploy, commit)
    @deploy, @commit = deploy, commit
  end

  def import
    return unless pivotal_uid.present?

    deploy.stories.find_or_initialize_by(uid: pivotal_uid).tap do |c|
      c.message = message
      c.date = commit.commit.author.date
      c.author = commit.committer.login if commit.committer

      c.save!
    end
  end

  private

  def pivotal_uid
    @pivotal_uid ||= PivotalUidExtractor.new(message).uid
  end

  def message
    commit[:commit][:message]
  end

  attr_reader :deploy, :commit
end
