class CreateArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.integer :price
      t.string :type
      t.integer :gallery_id
    end
  end
end
