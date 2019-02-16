class Artwork < ActiveRecord::Base
  belongs_to :gallery
  has_many :user_artworks
  has_many :users, through: :user_artworks

  def artwork_to_list(user)
    UserArtwork.create(user_id: user.id,artwork_id: self.id, sold: false)
  end

  def user_artwork(current_user)
    UserArtwork.find_by(artwork_id: self.id, user_id: current_user.id)
  end

  # def delete_artwork(current_user)
  #   self.user_artwork(current_user).delete
  # end

  def delete_artwork(current_user)
    user_artwork = self.user_artwork(current_user)
    if user_artwork.sold = true
      UserArtwork.delete_all(artwork_id: self.id)
      Artwork.find(self.id).delete
    end
    user_artwork.delete
  end


  def add_artwork(artwork,gallery)
    artwork[:gallery_id] = gallery.id
    Artwork.create(artwork)
  end

  def self.sorted_artworks(sold = false)
    if sold == false
      self.all.sort_by { |artwork| artwork.title.downcase }
    else
      sold = UserArtwork.all.select do  |user_artwork|
        user_artwork.sold == true
      end.map { |user_artwork | user_artwork.artwork }
      Artwork.all.select do  |artwork|
        !sold.include?(artwork)
      end.sort_by { |artwork| artwork.title.downcase }
    end
  end

  def mark_as_sold(current_user)
    user_artwork = self.user_artwork(current_user)
    if user_artwork.sold == true
       user_artwork.update_column(:sold, false)
    elsif user_artwork.sold == false
       user_artwork.update_column(:sold, true)
    end
  end

end
