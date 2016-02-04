require 'rails_helper'

describe Deploy, model: true do

  describe '.filter_by_date_range' do
    let(:lower_bound_date) { Time.zone.parse("2016-01-01") }
    let(:upper_bound_date) { Time.zone.parse("2016-01-15") }

    before do
      create(:deploy, time: lower_bound_date)
      create(:deploy, time: upper_bound_date)
      create(:deploy, time: lower_bound_date + 1.day)
      create(:deploy, time: lower_bound_date - 1.day)
      create(:deploy, time: upper_bound_date + 1.day)
    end

    it 'filter out records that fall outside the given date range' do
      expect(
        Deploy.filter_by_date_range(lower_bound_date, upper_bound_date).count
      ).to eq 3
    end

    context 'when given a nil date' do
      it 'raises an error' do
        expect {
          Deploy.filter_by_date_range(nil, nil)
        }.to raise_error("Nil date")
      end

      it 'raises an error upper_bound_date is nil' do
        expect {
          Deploy.filter_by_date_range(lower_bound_date, nil)
        }.to raise_error("Nil date")
      end

      it 'raises an error when lower_bound is nil' do
        expect {
          Deploy.filter_by_date_range(nil, upper_bound_date)
        }.to raise_error("Nil date")
      end
    end
  end

end
