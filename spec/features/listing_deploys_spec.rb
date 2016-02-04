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

  describe 'searching by date' do
    let(:lower_bound_date) { Time.zone.parse("2016-01-01") }
    let(:upper_bound_date) { Time.zone.parse("2016-01-15") }

    before do
      create(:deploy, time: lower_bound_date)
      create(:deploy, time: upper_bound_date)
      create(:deploy, time: lower_bound_date + 1.day)
      create(:deploy, time: lower_bound_date - 1.day)
      create(:deploy, time: upper_bound_date + 1.day)
    end

    scenario 'user sees only those deploys within given dates' do
      visit "/?lower_bound_date=#{lower_bound_date.strftime("%Y-%m-%d")}&upper_bound_date=#{upper_bound_date.strftime("%Y-%m-%d")}"
      expect(page).to have_text("Showing 3 deploys")
    end
  end
end
