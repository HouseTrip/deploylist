require 'spec_helper'
require_relative '../../app/services/title_cleaner'

describe TitleCleaner do
  describe '.call' do
    it 'removes pivotal tags' do
      input = 'Bookings: tabs test [#76291634]'
      expect(described_class.call(input)).to eq('Bookings: tabs test')
    end
  end
end
