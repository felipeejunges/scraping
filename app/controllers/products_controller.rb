# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.all
    @products = Product.page(params[:page]).per(params[:per_page]) if params[:page] && params[:per_page]

    render_response(@products)
  end

  # GET /buyers/1
  def show
    render_response(@product)
  end

  private

  def set_product
    @product = Product.find_by(code: params[:id])
  end

  def format_response
    %i[code barcode imported_at url product_name quantity categories packaging brands image_url]
  end

  def render_response(object)
    render json: object,
           only: format_response,
           methods: [:status]
  end
end
