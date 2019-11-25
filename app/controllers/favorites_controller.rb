class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :destroy]
  def index
    @favorites = current_user.favorite_photos
  end

  def destroy
    photo = Photo.find(params[:photo_id])
    favorite = current_user.favorites.find_by(photo_id: photo.id)
    favorite.destroy
    @photos = Photo.all
    @photo = photo
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    photo = Photo.find(params[:photo_id])
    favorite = current_user.favorites.new(photo_id: photo.id)
    favorite.save
    @photos = Photo.all
    @photo = photo
    @favorites = Favorite.where(user_id: current_user.id)
  end
end
