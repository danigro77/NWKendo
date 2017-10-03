class PhotographersController < ApplicationController

  def manage

  end

  private
  def photographer_params
    params.require(:photographer).permit(:full_name, :contact_email)
  end

end
