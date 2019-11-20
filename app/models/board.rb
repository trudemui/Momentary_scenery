class Board < ApplicationRecord
    has_many :comments
    # belongs_to :user
    validates :name, presence: true, length: {maximum: 10}
    validates :title, presence: true, length: {maximum: 50}
    validates :body, presence: true, length: {maximum: 2000}
end
