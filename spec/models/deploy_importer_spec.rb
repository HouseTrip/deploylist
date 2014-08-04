require 'rails_helper'

describe DeployImporter do
  describe '.import' do
    let(:deploy_details) do
      [{ 'id' => 5,
        'project_id' => 3,
        'environment' => 'staging6',
        'revision' => '072a7f8',
        'repository' => 'git@github.com:HouseTrip/HouseTrip-Web-App.git',
        'local_username' => 'jesper',
        'created_at' => '2014-08-04T17:47:57Z' }]
    end
    let(:deploy) { Deploy.last }

    subject { described_class }

    before { subject.import(deploy_details) }

    it 'stores the uid' do
      expect(deploy.uid).to eq('5')
    end

    it 'stores the revision' do
      expect(deploy.revision).to eq('072a7f8')
    end

    it 'stores the repository' do
      expect(deploy.repository).to eq('git@github.com:HouseTrip/HouseTrip-Web-App.git')
    end

    it 'stores the username' do
      expect(deploy.username).to eq('jesper')
    end

    it 'stores the project uid' do
      expect(deploy.project_uid).to eq('3')
    end
  end
end
