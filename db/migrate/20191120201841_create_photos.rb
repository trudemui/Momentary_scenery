class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :title, null: false
      t.text :caption, null: false
      t.text :image_id
      t.text :location
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
