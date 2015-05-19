module ApplicationHelper
  def github_diff_link(deploy, previous_deploy)
    return unless deploy && previous_deploy
    link_to "See the Full Diff",
      ("https://www.github.com/#{ENV['GITHUB_REPO']}/compare/" +
      previous_deploy.short_ref + "..." + deploy.short_ref)
  end

  def pivotal_link(story)
    return unless story.pivotal_uid
    link_to "##{story.pivotal_uid}",
      "https://www.pivotaltracker.com/story/show/#{story.pivotal_uid}",
      title: "Pivotal story"
  end

  def pull_request_link(story)
    link_to story.title,
      "https://www.github.com/#{ENV['GITHUB_REPO']}/pull/#{story.pull_request_uid}",
      title: " ##{story.pull_request_uid}"
  end
end
