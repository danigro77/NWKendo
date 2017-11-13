class CategoriesController < ApplicationController
  before_action :get_item,   only: [:destroy, :update, :edit]
  before_action :generate_type_list, only: [:new, :edit]
  before_action :authorize_admin

  def manage
    @categories = Category.all
  end

  def destroy
    if @category.delete
      flash[:notice] = "The category #{@category.full_name} was successfully deleted."
      redirect_to manage_categories_path
    else
      flash[:alert] = "The category #{@category.full_name} could not be deleted."
    end
  end

  def new
    @category = Category.new
  end

  def create
    if Category.create(category_params)
      flash[:notice] = "The category was successfully created"
      redirect_to manage_categories_path
    else
      flash[:alert] = "The category could not be created."
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "The category was sucessfully updated"
      redirect_to manage_categories_path
    else
      flash[:alert] = "The category could not be updated."
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :for_type, :description, :image_url)
  end
  def get_item
    @category = Category.find(params[:id])
  end

  def generate_type_list
    @type_list = Category.for_types.keys.to_a.collect {|p| [I18n.t("category.type.#{p}"), p ] }
  end
end
