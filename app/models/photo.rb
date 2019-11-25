class Photo < ApplicationRecord
    has_many :favorites, dependent: :destroy
    belongs_to :user

    def favorited_by?(current_user)
        favorites.where(user_id: current_user.id).exists?
    end

    mount_uploader :image, ImageUploader
end
