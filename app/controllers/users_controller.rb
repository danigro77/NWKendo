class UsersController < ApplicationController
  def new
  end
  def create
    user = User.new(user_params)
    if user.save
      # session[:user_id] = user.id
      redirect_to manage_path
    else
      redirect_to '/signup'
    end
  end

  def manage
    @user = User.all
  end

  private
  def user_params
    params.require(:user).permit(:is_admin, :email, :password, :password_confirmation)
  end
end
