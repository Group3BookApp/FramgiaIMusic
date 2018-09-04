module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def current_user? user
    user == current_user
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by id: user_id
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by id: user_id
      log_in user
      @current_user = user
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget current_user
    session.delete :user_id
    @current_user = nil
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end