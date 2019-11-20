class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :name, null: false
      t.text :comment, null: false
      t.integer :board_id, null: false

      t.timestamps
    end
  end
end
