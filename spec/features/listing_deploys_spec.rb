require "rails_helper"

RSpec.feature "Listing deploys" do
  include Warden::Test::Helpers
  Warden.test_mode!

  let(:user) { User.create(name: "Test user", email: "test@example.com") }

  before do
    login_as(user)
  end

  scenario "user only sees the most recent deploys" do
    51.times { create(:deploy) }

    visit "/"

    expect(page).to have_text("Showing 50 deploys")
  end
end
