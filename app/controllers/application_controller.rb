class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  def authorize_admin
    redirect_to :back, status: 401 unless current_admin
  end
end
