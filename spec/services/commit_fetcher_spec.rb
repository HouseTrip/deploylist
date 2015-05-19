require 'rails_helper'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
end

describe CommitFetcher do
  let!(:deploy) { create(:deploy, sha: '905e8f7c') }
  let!(:previous_deploy) { create(:deploy, sha: '9ce3e490') }

  subject { described_class.new(deploy, previous_deploy) }

  describe '#call' do
    it 'fetches and stores stories between two commits' do
      VCR.use_cassette('compare_deploys') do
        expect {
          subject.call
        }.to change{ deploy.reload.stories.count }.by(7)
      end
    end
  end
end
