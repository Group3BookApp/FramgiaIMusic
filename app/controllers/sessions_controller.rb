class SessionsController < Devise::SessionsController
  def new
    get_pre_login_url
    super
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def get_pre_login_url
    @referer_url = root_path
  end

  def after_sign_in_path_for resource
    sign_in_url = url_for(action: "new", controller: "sessions", only_path: false, protocol: "http")
    if @referer_url == sign_in_url
      super
    else
      @referer_url || root_path
    end
  end
end
