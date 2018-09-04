module Admin
  class AdminController < ApplicationController
    layout "admin/admin"

    def index; end

    def verify_admin
      return if current_user.admin?
      flash[:danger] = t ".not_admin"
      redirect_to root_url
    end
  end
end
