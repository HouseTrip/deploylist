class CommitImporter
  def initialize(deploy)
    @deploy = deploy
  end

  def import(commit)
    # uid UidExtractor.new(commit).extract

    deploy.stories.find_or_initialize_by(uid: commit.sha).tap do |c|
      c.message = commit.commit.message
      c.date = commit.commit.author.date
      c.author = commit.committer.login if commit.committer

      c.save!
    end
  end

  private

  attr_reader :deploy
end
