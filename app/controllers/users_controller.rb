class UsersController < ApplicationController
  before_action :get_user, only: [:edit, :update, :destroy]
  before_action :authorize_admin

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      # session[:user_id] = user.id #TODO: undo when user are allowed to log-in and admin cannot create new user
      redirect_to manage_users_path
    else
      flash[:alert] = "Could not create user"
      render :new
    end
  end

  def edit
  end

  def update
    @user.is_admin = params[:is_admin] == 'true'
    if @user.update(user_params)
      flash[:notice] = "User was updated"
      redirect_to manage_users_path
    else
      flash[:alert] = "Could not update user"
      render :edit
    end
  end

  def manage
    @users = User.all.order(:email)
  end

  def destroy
    if @user.delete
      flash[:notice] = "The user was successfully deleted."
      redirect_to manage_users_path
    else
      flash[:alert] = "The user could not be deleted."
    end
  end

  private
  def user_params
    params.require(:user).permit(:is_admin, :email, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(params[:id])
  end

end
