require_relative '../config/environment'

prompt = TTY::Prompt.new

user = User.new_user(prompt)
game = Game.new_game(user)

game.play(prompt)
puts user.my_highscore
User.leaders_table
# binding.pry
# Country.compare_pop_question


puts "HELLO WORLD"
