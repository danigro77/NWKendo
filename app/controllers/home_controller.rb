class HomeController < ApplicationController
  include QuestionsHelper

  def landing
    @images = Image.where(for_page: :home_landing)
    @new_image = Image.new(for_page: :home_landing)
    @links = {
        row_1: [
            {title: 'Dojo Info', path: manage_path, icon: 'dojo-icon'},
            {title: 'Resources & FAQ', path: manage_path, icon: 'resources-icon'},
            {title: 'Contact Us', path: 'mailto:daniela@email.com', icon: 'email-icon'},
        ],
        row_2: [
            {title: 'Practice Hours', path: manage_path, icon: 'date-range-white-icon',
              info: ['6:30PM to 8:30PM', 'Every Wednesday and Friday']},
            {title: 'Find Us At', path: manage_path, icon: 'location-white-icon',
              info: ['10510 5th Avenue NE, Seattle, WA 98125'],
              button: {text: 'Get directions'}},
            {title: 'First Time Visit', path: manage_path, icon: 'add-people-white-icon',
              info: ['Make sure you read this before your first visit']},
        ]
    }
  end

  def faq
    categories = Category.where(for_type: 'resource')
    @resources = Resource.all.group(categories)
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
        all: 'All Images',
        home_landing: 'Images Home'
    }
  end
end
