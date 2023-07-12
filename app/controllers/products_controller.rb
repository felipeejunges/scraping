# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.all
    @products = Product.page(params[:page]).per(params[:per_page]) if params[:page] && params[:per_page]

    render json: @products
  end

  # GET /buyers/1
  def show
    render json: @product
  end

  private

  def set_product
    @product = Product.find_by(code: params[:id])
  end
end
