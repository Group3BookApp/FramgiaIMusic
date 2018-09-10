class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: t(".profile_update")
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
