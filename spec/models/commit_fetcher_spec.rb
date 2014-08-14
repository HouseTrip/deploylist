require 'rails_helper'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
end

describe CommitFetcher do
  let!(:deploy) { create(:deploy, sha: '10f0393d') }
  let!(:previous_deploy) { create(:deploy, sha: 'd5f448e0') }

  subject { described_class.new(deploy, previous_deploy) }

  describe '#run' do
    it 'fetches and stores stories between two stories' do
      expect {
        VCR.use_cassette('compare_deploys') do
          subject.run
        end
      }.to change{ deploy.reload.stories.count }.by(32)
    end
  end
end
