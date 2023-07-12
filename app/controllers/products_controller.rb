# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.all
    @products = Product.page(params[:page]).per(params[:per_page]) if params[:page] && params[:per_page]

    format_and_render_response(@products)
  end

  # GET /buyers/1
  def show
    format_and_render_response(@product)
  end

  private

  def set_product
    @product = Product.find_by(code: params[:id])
  end

  def format_and_render_response(object)
    render json: object,
           only: %i[code barcode imported_t url product_name quantity categories packaging brands image_url],
           methods: [:status]
  end
end
