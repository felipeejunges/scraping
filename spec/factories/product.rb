# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    code { Faker::Barcode.unique.ean(13) }
    barcode { "#{Faker::Barcode.unique.ean(13)}(EAN / EAN-13)" }
    _status { :imported }
    imported_t { -1.hours.from_now }
    url { Faker::Internet.url }
    product_name { Faker::Commerce.product_name }
    quantity { '240 g' }
    categories { 'Meats, Prepared meats, Hams, White hams' }
    packaging { 'Film en plastique, Film en plastique' }
    brands { Faker::Commerce.brand }
    image_url { Faker::Internet.url }
  end
end
