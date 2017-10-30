class RepeatingMeetingsController < ApplicationController
  before_action :get_item,   only: [:destroy, :update, :edit]
  before_action :get_days, only: [:new, :edit]
  before_action :clean_days, only: [:create, :update]
  before_action :authorize_admin

  @default_events = [
      {
          name: 'Keiko',
          location: '10510 5th Avenue NE, Seattle, WA, 98125',
          description: 'Bi-weekly training session',
          days: [4,6],
          start_time: '6:30PM',
          end_time: '8:30PM',
      }
  ]

  def destroy
    if @repeating_meeting.delete
      flash[:notice] = "The meeting #{@repeating_meeting.name} was successfully deleted."
      redirect_to manage_meetings_path
    else
      flash[:alert] = "The meeting #{@repeating_meeting.name} could not be deleted."
    end
  end

  def new
    @repeating_meeting = RepeatingMeeting.new
  end

  def create
    if RepeatingMeeting.create(repeating_meeting_params)
      flash[:notice] = "The meeting was successfully created"
      redirect_to manage_meetings_path
    else
      flash[:alert] = "The meeting could not be created."
    end
  end

  def edit
  end

  def update
    if @repeating_meeting.update(repeating_meeting_params)
      flash[:notice] = "The meeting was sucessfully updated"
      redirect_to manage_meetings_path
    else
      flash[:alert] = "The meeting could not be updated."
    end
  end


  private
  def repeating_meeting_params
    params.require(:repeating_meeting).permit(:name, :start_time, :end_time, :days, :description, :location)
  end
  def get_item
    @repeating_meeting = RepeatingMeeting.find(params[:id])
  end
  def get_days
    days_array = @repeating_meeting && @repeating_meeting.days.present? ? @repeating_meeting.days.split(',') : []
    @days = [
        {name: "Sunday", value: 0, selected: days_array.include?('0')},
        {name: "Monday", value: 1, selected: days_array.include?('1')},
        {name: "Tuesday", value: 2, selected: days_array.include?('2')},
        {name: "Wednesday", value: 3, selected: days_array.include?('3')},
        {name: "Thursday", value: 4, selected: days_array.include?('4')},
        {name: "Friday", value: 5, selected: days_array.include?('5')},
        {name: "Saturday", value: 6, selected: days_array.include?('6')},
    ]
    @day_options = @days.inject('') {|html, day| html + add_option(day)}
  end
  def add_option(day)
    if day[:selected]
      "<option value='#{day[:value]}' selected>#{day[:name]}</option>"
    else
      "<option value='#{day[:value]}'>#{day[:name]}</option>"
    end
  end
  def clean_days
    params[:repeating_meeting][:days] = params[:repeating_meeting][:days].reject!{|day| day.blank? }.join(',')
  end
end