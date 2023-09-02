# frozen_string_literal: true

class ProductScrapingSchedulerJob < ApplicationJob
  def perform(_args = nil)
    initialize_collect
  end

  def initialize_collect
    mechanize = Mechanize.new
    body = Nokogiri::HTML(mechanize.get('https://world.openfoodfacts.org/').body)
    products = body.search('ul.products li').first(100)
    products.map! do |li|
      # Scheduling this way to test multi-queue
      ProductScrapingJob.set(queue: "product_scraping_#{randomize_queue}").perform_in(5, { 'li' => li.to_s })
    end
  end

  def randomize_queue
    available_numbers = [1, 2, 3]
    available_numbers.delete(@last_generated_number) if @last_generated_number
    @last_generated_number = available_numbers.sample
  end
end
