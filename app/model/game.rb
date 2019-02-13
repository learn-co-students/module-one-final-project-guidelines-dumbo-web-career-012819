class Game < ActiveRecord::Base
  belongs_to :user
  has_many :questions

  def self.new_game(user)
    Game.create(user_id: user.id, total_points: 0)
  end

  def play(prompt)
    Question.generate_q1(prompt, self)
    puts ''
    puts ''
    Question.generate_q2(prompt, self)
    puts ''
    puts ''
    Question.generate_q3(prompt, self)
    puts ''
    puts ''
    Question.generate_q4(prompt, self)
    puts ''
    puts ''
    Question.generate_q5(prompt, self)
    puts ''
    puts ''
    Question.generate_q6(prompt, self)
    puts ''
    puts ''
    Question.generate_q7(prompt, self)
    puts ''
    puts ''
    Question.generate_q1(prompt, self)
    puts ''
    puts ''
    Question.generate_q2(prompt, self)
    puts ''
    puts ''
    Question.generate_q3(prompt, self)
    puts ''
    puts ''
    Question.generate_q4(prompt, self)
    puts ''
    puts ''
    Question.generate_q5(prompt, self)
    puts ''
    puts ''
    Question.generate_q6(prompt, self)
    puts ''
    puts ''
    Question.generate_q7(prompt, self)
    puts ''
    puts ''

  end

  def display_game_score
    puts "You scored #{Game.find(self.id).total_points}/14"
  end
end
