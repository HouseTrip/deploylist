require 'rails_helper'

describe DeployFetcher do
  let(:uri) { "https://api.honeybadger.io/v1/projects/36361/deploys?auth_token=#{ENV['HONEYBADGER_TOKEN']}" }

  def stub_page(page)
    stub_request(:get, "#{uri}&page=#{page}")
      .to_return(status: 200, body: load_fixture("json/page_#{page}.json"))
  end

  let(:logger) { instance_double('DeployLogger') }

  subject { described_class.new(logger) }

  describe '#call' do
    before do
      stub_page(1)
      stub_page(2)
      allow(logger).to receive(:log)
    end

    it 'fetches and stores deploys from honeybadger' do
      expect { subject.call }.to change{ Deploy.count }.by(4)
    end

    it 'logs the fetch calls' do
      expect(logger).to receive(:log).with("Fetching Honeybadger info", newline: false).ordered
      expect(logger).to receive(:log).exactly(4).times.with(".", newline: false).ordered
      subject.call
    end
  end
end
