class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  include ApplicationHelper

  def authorize_admin
    redirect_to root_path, status: 401 unless current_user && current_user.is_admin
  end
end
