class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    elsif current_user.email == "" || current_user.name == ""
      flash[:alert] = ''
      redirect_to edit_user_registration_path
    else current_user.id != User.find_by("email = ?",current_user.email).id
      flash[:alert] = ''
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

