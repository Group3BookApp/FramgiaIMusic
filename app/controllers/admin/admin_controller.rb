module Admin
  class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :verify_admin
    layout "admin/admin"

    def index; end

    def verify_admin
      return if current_user.admin?
      flash[:danger] = t ".not_admin"
      redirect_to root_url
    end
  end
end
