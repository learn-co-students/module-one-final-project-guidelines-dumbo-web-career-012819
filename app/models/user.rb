class User < ActiveRecord::Base
  has_many :user_artworks
  has_many :artworks, through: :user_artworks
  has_many :galleries, through: :artworks

  def self.add_user(user_hash)
    if !User.find_by(username: user_hash[:username])
      User.create(user_hash)
    else
      return 0
    end
  end

  def self.user_login(user_hash)
    user = User.find_by(username: user_hash[:username], password: user_hash[:password])
    if user.instance_of? User
      user
    else
      return 0
    end
  end

  def user_artworks(artworks = false)
    if artworks == false
      UserArtwork.where(user_id: self.id).sort_by { |user_artwork| user_artwork.artwork.title.downcase }
    elsif  artworks == true
      UserArtwork.where(user_id: self.id).sort_by { |user_artwork| user_artwork.artwork.title.downcase }.map { |art| art.artwork}
    end
  end

  def artwork_count
    self.artworks.count
  end


end
