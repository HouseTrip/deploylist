require 'rails_helper'

describe DeployFetcher do
  let(:uri) { "https://api.honeybadger.io/v1/projects/36361/deploys?auth_token=#{ENV['HONEYBADGER_TOKEN']}" }

  def stub_page(page)
    stub_request(:get, "#{uri}&page=#{page}")
      .to_return(status: 200, body: load_fixture("page_#{page}.json"))
  end

  subject { described_class.new }

  describe '#run' do
    before do
      stub_page(1)
      stub_page(2)
    end

    it 'fetches and stores deploys from honeybadger' do
      expect { subject.run }.to change{ Deploy.count }.by(5)
    end
  end
end
