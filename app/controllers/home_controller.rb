class HomeController < ApplicationController
  def landing
    @images = Image.where(for_page: :home_landing)
    @new_image = Image.new(for_page: :home_landing)
  end

  def faq
  end
  def credits
  end
  def terms
  end

  def manage
    @all_image_types = [:all, :home_landing]
    @sym = ImagesController::SYMB
    @image_types = {
        all: 'all images',
        home_landing: 'carousel on landing page'
    }
  end
end
