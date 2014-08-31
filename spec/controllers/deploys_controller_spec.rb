require 'rails_helper'

describe DeploysController do
  describe "ping" do
    it 'is pong' do
      get :ping
      expect(response.body).to eq('pong')
    end
  end

  describe "fetch" do
    it 'kicks off an import' do
      expect(FullImport).to receive(:call).with(1)
      get :fetch
    end
  end
end
