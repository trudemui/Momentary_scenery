class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  def show
    # binding.pry
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to root_path
    end
    @favorites = @user.favorite_photos.limit(5)
    @photos = @user.photos.limit(5)
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

  def photos
    @user = User.find(params[:id])
    @photos = @user.photos
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :image, :first_name, :first_kana_name, :last_name, :last_kana_name, :email)
    end
end
