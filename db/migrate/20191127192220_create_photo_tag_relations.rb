class CreatePhotoTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :photo_tag_relations do |t|
      t.references :photo, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
