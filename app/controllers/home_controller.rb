class HomeController < ApplicationController
  def landing
    @images = Image.where(for_page: :home_landing)
    @new_image = Image.new(for_page: :home_landing)
  end
end
