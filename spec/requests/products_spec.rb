require 'swagger_helper'

RSpec.describe 'products', type: :request do

  path '/products' do
    parameter name: 'page', in: :query, type: :integer, description: 'page'
    parameter name: 'per_page', in: :query, type: :integer, description: 'per_page'
    get('list products') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/products/{code}' do
    # You'll want to customize the parameter types...
    parameter name: 'code', in: :path, type: :string, description: 'code'

    get('show product') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
