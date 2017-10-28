module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    user = @current_user ? @current_user : session[:user_id] ? User.get_user(session[:user_id]) : nil
    @current_user = user
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
