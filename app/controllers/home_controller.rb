class HomeController < ApplicationController
  def landing
    @images = Image.where(for_page: :home_landing)
    @new_image = Image.new(for_page: :home_landing)
  end

  def faq
    @questions = Question.order(position: :asc)
  end
  def credits
  end
  def terms
  end

  def manage
    @all_image_types = [:all, :home_landing]
    @sym = ImagesController::SYMB
    @all_sym = 'all_inclusive'
    @mange_sym = 'edit'
    @image_types = {
        all: 'all images',
        home_landing: 'carousel on landing page'
    }
  end
end
