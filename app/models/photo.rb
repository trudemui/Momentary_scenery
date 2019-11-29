class Photo < ApplicationRecord
    has_many :favorites, dependent: :destroy
    has_many :photo_tag_relations
    has_many :tags, through: :photo_tag_relations
    belongs_to :user

    validates :title, length: { minimum: 1, maximum: 10 },
    presence: true
    validates :caption, length: { minimum: 1, maximum: 500 },
    presence: true

    acts_as_paranoid

    def favorited_by?(current_user)
        favorites.where(user_id: current_user.id).exists?
    end

    mount_uploader :image, ImageUploader
end
