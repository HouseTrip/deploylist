require 'spec_helper'
require_relative '../../app/services/uid_extractor'

commits = <<-EOS
  Merge pull request #6544 from HouseTrip/guest-acquisition/quick-fix-home-page-hero-height-incorrect-76870254
  Merge some_branch from HouseTrip/mobile/fix-broken-party-member-csv-file-76937022
  Merge pull request #6520 from HouseTrip/internal/flaky-enquiry-sent-banner-spec-fix
  [#6520] from HouseTrip/internal/flaky-enquiry-sent-banner-spec-fix
  [#6520] from HouseTrip/internal/flaky-enquiry-sent-fix-123456
EOS

describe UidExtractor do
  let(:messages) { commits.split("\n").map(&:strip) }

  describe '#pull_request_uid' do
    it 'returns a github pr uid' do
      expect(described_class.new(messages[0]).pull_request_uid).to eq('6544')
    end

    it 'returns nil if no ID is found' do
      expect(described_class.new(messages[1]).pull_request_uid).to be_nil
    end

    it 'does not include other numbers' do
      expect(described_class.new(messages[3]).pull_request_uid).to be_nil
      expect(described_class.new(messages[4]).pull_request_uid).to be_nil
    end
  end

  describe '#pivotal_uid' do
    it 'returns a pivotal story uid' do
      expect(described_class.new(messages[0]).pivotal_uid).to eq('76870254')
    end

    it 'returns the story id for non-pr commits' do
      expect(described_class.new(messages[1]).pivotal_uid).to eq('76937022')
    end

    it 'returns nil if no ID is found' do
      expect(described_class.new(messages[2]).pivotal_uid).to be_nil
    end

    it 'does not include other numbers' do
      expect(described_class.new(messages[3]).pivotal_uid).to be_nil
    end
  end
end
