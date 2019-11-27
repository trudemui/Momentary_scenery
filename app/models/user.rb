class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  before_save { self.email = email.downcase }

  validates :first_name, format: { with: /\A[一-龥ぁ-ん]+\z/ }, length: { minimum: 1, maximum: 10 },
    presence: true
  validates :last_name, format: { with: /\A^[一-龥ぁ-ん]+\z/ }, length: { minimum: 1, maximum: 10 },
    presence: true
    validates :first_kana_name, format: { with: /\A^([ァ-ン]|ー)+$\z/ }, length: { minimum: 1, maximum: 10 },
    presence: true
  validates :last_kana_name, format: { with: /\A^([ァ-ン]|ー)+$\z/ }, length: { minimum: 1, maximum: 10 },
    presence: true
    validates :nickname, length: { minimum: 1, maximum: 10 },
    presence: true
    validates :email, format: { with: /\A\S+@\S+\.\S+\z/ }, length: { maximum: 40 },
    presence: true

    has_many :photos, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_photos, through: :favorites, source: :photo

    def favorited_by(current_user)
      favorites.where(user_id: current_user.id).exists?
    end

    mount_uploader :image, ImageUploader
end
