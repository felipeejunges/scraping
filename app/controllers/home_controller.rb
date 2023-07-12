# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render json: { message: 'Fullstack Challenge 20201026' }
  end
end
