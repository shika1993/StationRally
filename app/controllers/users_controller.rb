class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      flash[:email] = current_user.email
      flash[:name] = current_user.name
      redirect_to edit_user_registration_path
    end
  end

  def show
    @images = Image.where("user_id = ?", current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  private

  def image_params
    params.require(:image).permit(:picture, :text).merge(user_id: current_user.id)

  end
end

