class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :title, null: false
      t.text :caption, null: false
      t.string :image, null: false
      t.string :address
      t.string :latitude
      t.string :longitude
      t.string :latitudeRef
      t.string :longitudeRef
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
