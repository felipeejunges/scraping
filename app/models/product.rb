# frozen_string_literal: true

class Product
  include Mongoid::Document
  include Mongoid::Enum

  field :code, type: Integer
  field :barcode, type: String
  field :imported_at, type: DateTime
  field :url, type: String
  field :product_name, type: String
  field :quantity, type: String
  field :categories, type: String
  field :packaging, type: String
  field :brands, type: String
  field :image_url, type: String
  enum :status, %i[draft imported], default: :draft

  validates :code, :product_name, presence: true
  validates :code, uniqueness: true
end
