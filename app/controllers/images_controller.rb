class ImagesController < ApplicationController
  before_action :get_item,   only: [:destroy, :update, :edit]
  before_action :authorize_admin

  def manage
    @images = Image.where(for_page: params[:type])
  end

  def destroy
    if @image.delete
      flash[:notice] = "The image #{@image.title} was sucessfully deleted."
      render 'home/landing'
    else
      flash[:alert] = "The image #{@image.title} could not be deleted."
    end
  end

  def new

  end

  def create
    if Image.create(image_params)
      flash[:notice] = "The image was sucessfully created"
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
    params.require(:image).permit(:url, :title, :description, :photographer, :for_page)
  end

  def get_item
    @image = Image.find(params[:id])
  end
end
