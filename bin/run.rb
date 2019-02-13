require_relative '../config/environment'

prompt = TTY::Prompt.new

user = User.new_user(prompt)

def run(prompt, user)

  choices = ["New Game", "My Highscore", "Leaderboard", "Exit"]

  input = prompt.select("Menu", choices)
  if input == "New Game"
    game = Game.new_game(user)
    game.play(prompt)
    game.display_game_score
    run(prompt, user)
  elsif input == "My Highscore"
    puts user.my_highscore
    run(prompt, user)
  elsif input == "Leaderboard"
    User.leaders_table
    run(prompt, user)
  elsif input == "Exit"
    puts "BYEEEEEE"
  end
end
# binding.pry
# Country.compare_pop_question

run(prompt, user)
puts "HELLO WORLD"
