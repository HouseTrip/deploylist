require "rails_helper"

RSpec.feature "Deploy comments" do
  include Warden::Test::Helpers
  Warden.test_mode!

  let(:user) { User.create(name: "Test user", email: "test@example.com") }

  before do
    login_as(user)
  end

  scenario "can see the comments for the deploy" do
    deploy = create(:deploy)

    5.times { create(:comment, deploy: deploy, user: user) }

    visit deploy_comments_path(deploy_sha: deploy.sha)

    expect(page).to have_text("Showing 5 comments")
  end

  scenario "Can see the comment text on the page"
end
