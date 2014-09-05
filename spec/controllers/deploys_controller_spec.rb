require 'rails_helper'

describe DeploysController do
  describe "ping" do
    it 'is pong' do
      get :ping
      expect(response.body).to eq('pong')
    end
  end

  describe "deploy" do
    before do
      allow(FullImport).to receive(:call)
    end

    it 'kicks off an import' do
      get :deploy
      expect(FullImport).to have_received(:call).with(limit: 1, stream: response.stream)
    end

    it 'uses text/event-stream' do
      get :deploy
      expect(response.headers['Content-Type']).to eq('text/event-stream')
    end
  end
end
