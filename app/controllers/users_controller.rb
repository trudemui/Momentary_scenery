class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :profile_image_id, :first_name, :first_kana_name, :last_name, :last_kana_name,:email, :password)
    end

end
