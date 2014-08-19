require 'rails_helper'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
end

# Github compare
# https://github.com/HouseTrip/HouseTrip-Web-App/compare/9ce3e49025297b7791263e01a2b633e1d4b896b0...905e8f7c31e86b0dc556fdd900c74936bd4c8b19

describe CommitFetcher do
  let!(:deploy) { create(:deploy, sha: '905e8f7c') }
  let!(:previous_deploy) { create(:deploy, sha: '9ce3e490') }

  subject { described_class.new(deploy, previous_deploy) }

  describe '#run' do
    it 'fetches and stores stories between two commits' do
      VCR.use_cassette('compare_deploys') do
        expect {
          subject.run
        }.to change{ deploy.reload.stories.count }.by(7)
      end
    end
  end
end
