require 'rails_helper'

describe DeployFetcher do
  subject { described_class.new }

  describe '#fetch' do
    before do
      # page 1
      stub_request(:get, "https://api.honeybadger.io/v1/projects/36361/deploys?auth_token=9C9sj9EF89xVeVojvHpa&page=1").
        to_return(status: 200, body: load_fixture('page_1.json'))

      # page 2
      stub_request(:get, "https://api.honeybadger.io/v1/projects/36361/deploys?auth_token=9C9sj9EF89xVeVojvHpa&page=2").
        to_return(status: 200, body: load_fixture('page_2.json'))
    end

    it 'fetches and stores deploys from honeybadger' do
      expect { subject.fetch }.to change{ Deploy.count }.by(5)
    end
  end
end
