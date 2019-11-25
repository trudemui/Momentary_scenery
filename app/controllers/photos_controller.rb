class PhotosController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    PER = 40

    def new
        @photo = Photo.new(params[:id])
        # binding.pry
    end

    def create
        @photo = Photo.new(photo_params)
        # binding.pry
        @photo.user_id = current_user.id
        @photo.latitude = @photo.image.get_exif_info[0]
        @photo.longitude = @photo.image.get_exif_info[1]
        @photo.latitudeRef = @photo.image.get_exif_info[2]
        @photo.longitudeRef = @photo.image.get_exif_info[3]
        @photo.save
        redirect_to photo_path(@photo)
    end

    def index
        @photos = Photo.all
        @photos = Photo.page(params[:page]).per(PER)
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
        redirect_to photos_path
    end

    def top
        @slide_photos = Photo.all.order(created_at: :desc).limit(10)
        @favorite_ranks = Photo.find(Favorite.group(:photo_id).order('count(photo_id) desc').limit(5).pluck(:photo_id))
        @new_photos =Photo.order(created_at: :desc).limit(20)
        # @photo = Photo.find(params[:id])
    end
    private

    def photo_params
        params.require(:photo).permit(:title, :caption, :image, :location, :user_id, :longitude, :latitude)
    end
end
