class ResourcesController < ApplicationController
  before_action :get_item,   only: [:destroy, :update, :edit]
  before_action :authorize_admin

  def manage
    @resources = Resource.all
  end

  def destroy
    if @resource.delete
      flash[:notice] = "The resource #{@resource.full_name} was successfully deleted."
      redirect_to manage_resources_path
    else
      flash[:alert] = "The resource #{@resource.full_name} could not be deleted."
    end
  end

  def new
    @resource = Resource.new
  end

  def create
    if Resource.create(resource_params)
      flash[:notice] = "The resource was successfully created"
      redirect_to manage_resources_path
    else
      flash[:alert] = "The resource could not be created."
    end
  end

  def edit
  end

  def update
    if @resource.update(resource_params)
      flash[:notice] = "The resource was sucessfully updated"
      redirect_to manage_resources_path
    else
      flash[:alert] = "The resource could not be updated."
    end
  end

  private
  def resource_params
    params.require(:resource).permit(:title, :url, :category_id, :description)
  end
  def get_item
    @resource = Resource.find(params[:id])
  end
end
