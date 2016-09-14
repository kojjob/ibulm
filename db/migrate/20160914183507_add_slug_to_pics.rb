class AddSlugToPics < ActiveRecord::Migration[5.0]
  def change
    add_column :pics, :slug, :string
    add_index :pics, :slug, unique: true
  end
end
