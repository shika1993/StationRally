class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params) && current_user.name != ""
      redirect_to root_path
    else
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

