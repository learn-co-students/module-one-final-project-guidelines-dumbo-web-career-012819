class Game < ActiveRecord::Base
  belongs_to :user
  has_many :questions

  def self.new_game(user)
    Game.create(user_id: user.id, total_points: 0)
  end
end
