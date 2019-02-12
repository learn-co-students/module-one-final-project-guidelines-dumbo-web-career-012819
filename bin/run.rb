require_relative '../config/environment'

prompt = TTY::Prompt.new

user = User.new_user(prompt)
game = Game.new_game(user)
Question.generate_q1(prompt, game)
Question.generate_q2(prompt, game)
Question.generate_q3(prompt, game)
Question.generate_q4(prompt, game)
Question.generate_q5(prompt, game)
Question.generate_q6(prompt, game)
Question.generate_q1(prompt, game)
Question.generate_q2(prompt, game)
Question.generate_q3(prompt, game)
Question.generate_q4(prompt, game)
Question.generate_q5(prompt, game)
Question.generate_q6(prompt, game)
puts user.my_highscore
User.leaders_table
# binding.pry
# Country.compare_pop_question


puts "HELLO WORLD"
