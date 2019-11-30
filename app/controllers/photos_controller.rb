class PhotosController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    PER = 40

    def new
        @photo = Photo.new(params[:id])
        # binding.pry
    end

    def create
        @photo = Photo.new(photo_params)
        @photo.user_id = current_user.id
        if @photo_latitude = @photo.image.get_exif_info[0]
            @cut_latitude = @photo_latitude.split(",")
            @num_latitude = @cut_latitude.map!(&:to_i)
            @latdegree = @cut_latitude.map!(&:to_i).first
            @latminute = @cut_latitude.map!(&:to_i).second
            @latsecond = @cut_latitude.map!(&:to_i).third
            @photo.latitude = @latdegree/1 + @latminute/60.to_f + @latsecond/3600000.to_f
            @photo_longitude = @photo.image.get_exif_info[1]
            @cut_longitude = @photo_longitude.split(",")
            @num_longitude = @cut_longitude.map!(&:to_i)
            @londegree = @cut_longitude.map!(&:to_i).first
            @lonminute = @cut_longitude.map!(&:to_i).second
            @lonsecond = @cut_longitude.map!(&:to_i).third
            @photo.longitude = @londegree/1 + @lonminute/60.to_f + @lonsecond/3600000.to_f
            @photo.save
        else
        @photo.save
        end
        redirect_to photo_path(@photo)
    end
    
    def index
        @photos = params[:tag_id].present? ? Tag.find(params[:tag_id]).photos : Photo.all
        @photos = @photos.page(params[:page]).per(PER)
        # @photos = Photo.page(params[:page]).per(PER)
    end
    
    def show
        @photo = Photo.find(params[:id])
        # @power = @a/1 + @b/60.to_f + @c/3600000.to_f


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
        params.require(:photo).permit(:title, :caption, :image, :address, :user_id, :longitude, :latitude, tag_ids: [])
    end
end
