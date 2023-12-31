# frozen_string_literal: true

class ProductScrapingJob < ApplicationJob
  attr_reader :mechanize

  def perform(args = {})
    @mechanize = Mechanize.new

    collect(args['li'])
  end

  def collect(li_tag)
    li_tag = Nokogiri::HTML(li_tag)
    a = li_tag.search('a').first
    a_link = a.attributes['href']
    code = a_link.value.split('/')[2]

    product = Product.find_or_create_by(code:)

    product.image_url = li_tag.search('img').first.attributes['src'].value

    collect_details("https://world.openfoodfacts.org#{a_link}", product)
    product.imported_at = Time.now
    product.status = :imported
    product.save
  end

  def collect_details(product_url, product)
    body = Nokogiri::HTML(mechanize.get(product_url).body)

    product.url = product_url
    product.product_name = body.search("span[id='field_generic_name_value']").text
    product.barcode = body.search("p[id='barcode_paragraph']")&.text&.split(':')&.[](1)&.strip || "#{product.code} (Ambiguous barcode)"
    product.quantity = body.search("span[id='field_quantity_value']").text
    product.packaging = body.search("span[id='field_packaging_value']").text
    product.brands = body.search("span[id='field_brands_value']").text
    product.categories = body.search("span[id='field_categories_value']").text
  end
end
