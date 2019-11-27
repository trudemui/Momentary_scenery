class Tag < ApplicationRecord
    has_many :photo_tag_relations
    has_many :photos, through: :photo_tag_relations
end
