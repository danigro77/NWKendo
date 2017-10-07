class PhotographersController < ApplicationController
  before_action :get_item,   only: [:destroy, :update, :edit]
  before_action :authorize_admin

  def manage
    @photographers = Photographer.all
  end

  def destroy
    if @photographer.delete
      flash[:notice] = "The photographer #{@photographer.full_name} was successfully deleted."
      redirect_to manage_photographers_path
    else
      flash[:alert] = "The photographer #{@photographer.full_name} could not be deleted."
    end
  end

  def new
    @photographer = Photographer.new
  end

  def create
    if Photographer.create(photographer_params)
      flash[:notice] = "The photographer was successfully created"
      redirect_to manage_photographers_path
    else
      flash[:alert] = "The photographer could not be created."
    end
  end

  def edit
  end

  def update
    if @photographer.update(photographer_params)
      flash[:notice] = "The photographer was sucessfully updated"
      redirect_to manage_photographers_path
    else
      flash[:alert] = "The photographer could not be updated."
    end
  end

  private
  def photographer_params
    params.require(:photographer).permit(:full_name, :contact_email)
  end
  def get_item
    @photographer = Photographer.find(params[:id])
  end
end
