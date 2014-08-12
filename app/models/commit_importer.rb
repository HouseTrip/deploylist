class CommitImporter
  def initialize(deploy)
    @deploy = deploy
  end

  def import(commit)
    deploy.commits.find_or_initialize_by(sha: commit.sha).tap do |c|
      c.message = commit.commit.message
      c.date = commit.commit.author.date
      c.author = commit.committer.login

      c.save!
    end
  end

  private

  attr_reader :deploy
end
