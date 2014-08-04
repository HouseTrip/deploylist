require 'rails_helper'

describe DeployFetcher do
  let(:uri) { "https://api.honeybadger.io/v1/projects/36361/deploys?auth_token=#{ENV['HONEYBADGER_TOKEN']}" }

  subject { described_class.new }

  describe '#fetch' do
    before do
      stub_request(:get, "#{uri}&page=1").to_return(status: 200, body: load_fixture('page_1.json'))
      stub_request(:get, "#{uri}&page=2").to_return(status: 200, body: load_fixture('page_2.json'))
    end

    it 'fetches and stores deploys from honeybadger' do
      expect { subject.fetch }.to change{ Deploy.count }.by(5)
    end
  end
end
