class ImagesController < ApplicationController
  before_action :get_item,   only: [:destroy]

  def destroy
    if @image.delete
      flash[:notice] = "The image #{@image.title} was sucessfully deleted."
      render 'home/landing'
    else
      flash[:alert] = "The image #{@image.title} could not be deleted."
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
