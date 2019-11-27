class AddDeletedAtToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :deleted_at, :datetime
  end
end
