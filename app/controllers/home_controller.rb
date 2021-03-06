class HomeController < ApplicationController
  include QuestionsHelper
  include CalendarHelper
  before_action :authorize_admin, only: [:manage]

  def landing
    @images = Image.where(for_page: :home_landing)
  end

  def material
    @categories = Category.all.where(for_type: 'resource')
    # @grouped_resources = {}
    # @categories.each do |cat|
    #   @grouped_resources[cat.id] = Resource.where(category: cat)
    # end
    # @questions = Question.all.order(position: :asc)
  end
  def credits
  end
  def terms
  end

  def map
    @address = location_schedule[:address]
    @hash = Gmaps4rails.build_markers([@address]) do |address, marker|
      marker.lat address[:lat]
      marker.lng address[:lng]
      marker.infowindow "#{address[:street]}, #{address[:city]}"
    end
  end

  def schedule
    @images = Image.all.where(for_page: :schedule)
    @meetings_by_day = Meeting.all.group_by{ |meeting|
      meeting.start_time.to_date
    }
    repeating_meetings = RepeatingMeeting.all
    @repeating_meetings = {}
    repeating_meetings.each do |repeating_meeting|
      days = repeating_meeting.days.split(',')
      days.each do |day|
        @repeating_meetings[day] = repeating_meeting
      end
    end
    @date = Date.parse(params[:date])
  end

  def manage
    @all_image_types = [:all, :home_landing, :schedule]
    @sym = ImagesController::SYMB
    @all_sym = 'all_inclusive'
    @mange_sym = 'edit'
    @image_types = {
        all: 'All Images',
        home_landing: 'Images Home',
        schedule: 'Schedule',
    }
  end
end
