class VideosController < ApplicationController
  before_action :get_item,   only: [:destroy, :update, :edit]
  before_action :authorize_admin
  
  def manage
    @videos = Video.all
  end

  def destroy
    if @video.delete
      flash[:notice] = "The video #{@video.title} was successfully deleted."
      redirect_to manage_videos_path
    else
      flash[:alert] = "The video #{@video.title} could not be deleted."
    end
  end

  def new
    @video = Video.new
  end

  def create
    if Video.create(video_params)
      flash[:notice] = "The video was successfully created"
      redirect_to manage_videos_path
    else
      flash[:alert] = "The video could not be created."
    end
  end

  def edit
  end

  def update
    if @video.update(video_params)
      flash[:notice] = "The video was sucessfully updated"
      redirect_to manage_videos_path
    else
      flash[:alert] = "The video could not be updated."
    end
  end

  private
  def video_params
    params.require(:video).permit(:url, :title, :description, :taken_on)
  end

  def get_item
    @video = Video.find(params[:id])
  end
end
