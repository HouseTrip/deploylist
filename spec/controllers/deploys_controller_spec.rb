require 'rails_helper'

describe DeploysController do
  describe "ping" do
    it 'is pong' do
      get :ping
      expect(response.body).to eq('pong')
    end
  end
end
