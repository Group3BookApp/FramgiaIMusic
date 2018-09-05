module Admin
  class UsersController < AdminController
    before_action :load_user, only: :destroy

    def index
      @users = User.page(params[:page]).per Settings.per_page
    end

    def destroy
      if @user.destroy
        flash[:success] = "Deleted"
      else
        flash[:error] = "Delete fail"
      end
      redirect_to admin_users_url
    end

    private

    def load_user
      @user = User.find_by id: params[:id]
      return if @user
      flash[:danger] = "Not found"
      redirect_to admin_users_url
    end
  end
end
