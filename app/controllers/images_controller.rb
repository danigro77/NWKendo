class ImagesController < ApplicationController
  before_action :get_item,   only: [:destroy, :update, :edit]
  before_action :authorize_admin

  SYMB = {
      all: 'all_inclusive',
      home_landing: 'home',
      schedule: 'date_range',
  }

  def manage
    @sym = SYMB
    if params[:type].nil? || params[:type] == '-1'
      @type = 'all'
      @images = Image.all
    else
      @type = params[:type]
      @images = Image.where(for_page: @type)
    end
  end

  def destroy
    if @image.delete
      flash[:notice] = "The image #{@image.title} was successfully deleted."
      redirect_to manage_images_path(@image.for_page)
    else
      flash[:alert] = "The image #{@image.title} could not be deleted."
    end
  end

  def new
  end

  def new_image
    @image = Image.new(for_page: params[:type])
    @type = params[:type]
  end

  def create
    if Image.create(image_params)
      flash[:notice] = "The image was successfully created"
      redirect_to manage_images_path(params[:image][:for_page])
    else
      flash[:alert] = "The image could not be created."
    end
  end

  def edit
  end

  def update
    if @image.update(image_params)
      flash[:notice] = "The image was sucessfully updated"
      redirect_to manage_images_path(@image.for_page)
    else
      flash[:alert] = "The image could not be updated."
    end
  end

  private
  def image_params
    params.require(:image).permit(:url, :title, :description, :for_page, :photographer_id, photographer_attributes: [:full_name, :contact_email])
  end

  def get_item
    @image = Image.find(params[:id])
  end
end
