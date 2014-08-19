require 'spec_helper'

commits = <<-EOS
  Merge pull request #6544 from HouseTrip/guest-acquisition/quick-fix-home-page-hero-height-incorrect-76870254
  Merge some_branch from HouseTrip/mobile/fix-broken-party-member-csv-file-76937022
  Merge pull request #6520 from HouseTrip/internal/flaky-enquiry-sent-banner-spec-fix
  [#6520] from HouseTrip/internal/flaky-enquiry-sent-banner-spec-fix
  [#6520] from HouseTrip/internal/flaky-enquiry-sent-fix-123456
EOS

describe UidExtractor do
  let(:messages) { commits.split("\n").map(&:strip) }

  describe '#pr_uid' do
    it 'returns a github pr uid' do
      expect(described_class.new(messages[0]).pr_uid).to eq('6544')
    end

    it 'returns nil if no ID is found' do
      expect(described_class.new(messages[1]).pr_uid).to be_nil
    end

    it 'does not include other numbers' do
      expect(described_class.new(messages[3]).pr_uid).to be_nil
      expect(described_class.new(messages[4]).pr_uid).to be_nil
    end
  end

  describe '#pt_uid' do
    it 'returns a pivotal story uid' do
      expect(described_class.new(messages[0]).pt_uid).to eq('76870254')
    end

    it 'returns the story id for non-pr commits' do
      expect(described_class.new(messages[1]).pt_uid).to eq('76937022')
    end

    it 'returns nil if no ID is found' do
      expect(described_class.new(messages[2]).pt_uid).to be_nil
    end

    it 'does not include other numbers' do
      expect(described_class.new(messages[3]).pt_uid).to be_nil
    end
  end
end
