class MeetingsController < ApplicationController
  before_action :get_item,   only: [:destroy, :update, :edit]
  before_action :authorize_admin

  def manage
    @meetings = Meeting.all
    @repeating_meetings = RepeatingMeeting.all
  end

  def destroy
    if @meeting.delete
      flash[:notice] = "The meeting #{@meeting.name} was successfully deleted."
      redirect_to manage_meetings_path
    else
      flash[:alert] = "The meeting #{@meeting.name} could not be deleted."
    end
  end

  def new
    @meeting = Meeting.new
  end

  def create
    if Meeting.create(meeting_params)
      flash[:notice] = "The meeting was successfully created"
      redirect_to manage_meetings_path
    else
      flash[:alert] = "The meeting could not be created."
    end
  end

  def edit
  end

  def update
    if @meeting.update(meeting_params)
      flash[:notice] = "The meeting was sucessfully updated"
      redirect_to manage_meetings_path
    else
      flash[:alert] = "The meeting could not be updated."
    end
  end

  private
  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time, :description, :location)
  end
  def get_item
    @meeting = Meeting.find(params[:id])
  end
end
