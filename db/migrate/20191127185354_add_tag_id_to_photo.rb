class AddTagIdToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :tag_id, :string
  end
end
