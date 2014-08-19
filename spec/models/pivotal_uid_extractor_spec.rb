require 'spec_helper'

describe PivotalUidExtractor do
  describe '#uid' do
    it 'returns a pivotal story id' do
      expect(described_class.new("[#123456] Some text").uid).to eq('123456')
    end

    it 'returns nil if no ID is found' do
      expect(described_class.new("Some text").uid).to be_nil
    end

    it 'does not include other numbers' do
      expect(described_class.new("123456 Some text").uid).to be_nil
    end
  end
end
