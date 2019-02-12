require_relative '../config/environment'

prompt = TTY::Prompt.new

user = User.new_user(prompt)
game = Game.new_game(user)
Question.generate_q1(prompt, game)
Question.generate_q1(prompt, game)
Question.generate_q1(prompt, game)
Question.generate_q1(prompt, game)
Question.generate_q1(prompt, game)
binding.pry
# Country.compare_pop_question


puts "HELLO WORLD"
