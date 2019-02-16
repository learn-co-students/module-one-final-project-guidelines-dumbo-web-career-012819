class AddSoldColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :user_artworks, :sold, :boolean
  end
end
