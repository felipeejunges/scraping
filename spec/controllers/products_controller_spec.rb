
require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns all products to @products' do
      product1 = create(:product)
      product2 = create(:product)

      get :index
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.map { |p| p['code'] }).to include(product1.code, product2.code)
    end

    it 'paginates products if page and per_page parameters are provided' do
      create_list(:product, 5)

      get :index, params: { page: 2, per_page: 3 }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.count).to eq(3)
    end
  end

  describe '#show' do
    let(:product) { create(:product) }

    it 'returns a successful response' do
      get :show, params: { id: product.code }
      expect(response).to have_http_status(:success)
    end

    it 'assigns the correct product to @product' do
      get :show, params: { id: product.code }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['code']).to eq(product.code)
    end
  end
end