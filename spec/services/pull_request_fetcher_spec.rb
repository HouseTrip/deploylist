require 'rails_helper'

describe PullRequestFetcher do
  let(:story) { Story.create(pull_request_uid: '6558') }

  subject { described_class.new(story) }

  describe '#call' do
    it 'fetches and stores the pull request title' do
      VCR.use_cassette('pull_request') { subject.call }
      expect(story.title).to eq("Team: My new wizzo bang feature")
    end
  end
end
