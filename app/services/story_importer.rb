class StoryImporter
  def initialize(deploy, commit)
    @deploy, @commit = deploy, commit
  end

  def import
    return unless pivotal_uid.present? || pull_request_uid.present?

    deploy.stories.find_or_initialize_by(pull_request_uid: pull_request_uid).tap do |c|
      c.pivotal_uid = pivotal_uid
      c.message = message
      c.date = commit.commit.author.date
      # c.author = commit.committer.login if commit.committer

      c.save!
    end
  end

  private

  attr_reader :deploy, :commit

  def pivotal_uid
    UidExtractor.new(message).pivotal_uid
  end

  def pull_request_uid
    UidExtractor.new(message).pull_request_uid
  end

  def message
    commit[:commit][:message]
  end
end
