
require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#index' do
    it 'renders the JSON message' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).to eq({ message: 'Fullstack Challenge 20201026' }.to_json)
    end
  end
end