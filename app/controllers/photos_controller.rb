class PhotosController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def new
        @photo = Photo.new(params[:id])
    end

    def create
        # binding.pry
        @photo = Photo.new(photo_params)
        @photo.user_id = current_user.id
        @photo.save
        redirect_to top_photos_path
    end

    def index
        @photos = Photo.all
    end

    def show
        @photo = Photo.find(params[:id])
        # @photo.user_id = current_user.id
    end

    def edit
        @photo = Photo.find(params[:id])
    end

    def update
        @photo = Photo.find(params[:id])
        @photo.update(photo_params)
        redirect_to photo_path(@photo)
    end

    def destroy
        @photo = Photo.find(params[:id])
        @photo.destroy
        redirect_to top_photos_path
    end

    def top
        @slide_photos = Photo.all.order(created_at: :desc).limit(10)
        @favorite_ranks = Photo.find(Favorite.group(:photo_id).order('count(photo_id) desc').limit(3).pluck(:photo_id))
        @new_photos =Photo.order(created_at: :desc).limit(20)
        # @photo = Photo.find(params[:id])
    end
    private

    def photo_params
        params.require(:photo).permit(:title, :caption, :image, :location, :user_id)
    end
end
