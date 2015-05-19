require 'rails_helper'

describe DeployImporter do
  describe '.import' do
    let(:deploy) { Deploy.last }
    let(:deploy_details) do
      [{ 'id' => 5,
        'project_id' => 3,
        'environment' => 'production',
        'revision' => '072a7f8',
        'repository' => 'git@github.com:organisation/github-repo.git',
        'local_username' => 'jesper',
        'created_at' => '2014-08-04T17:47:57Z' }]
    end

    subject { described_class }

    before { subject.import(deploy_details) }

    it 'stores the uid' do
      expect(deploy.uid).to eq('0563c4e04d3d63ba875ed6b43048eec87f309d55')
    end

    it 'stores the sha' do
      expect(deploy.sha).to eq('072a7f8')
    end

    it 'stores the repository' do
      expect(deploy.repository).to eq('git@github.com:organisation/github-repo.git')
    end

    it 'stores the username' do
      expect(deploy.username).to eq('jesper')
    end

    it 'stores the project uid' do
      expect(deploy.project_uid).to eq('12345')
    end

    it 'stores the environment' do
      expect(deploy.environment).to eq('production')
    end
  end
end
