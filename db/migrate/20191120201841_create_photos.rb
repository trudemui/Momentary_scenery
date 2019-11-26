class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :title, null: false
      t.text :caption, null: false
      t.string :image, null: false
      t.text :address
      t.float :latitude
      t.float :longitude
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
