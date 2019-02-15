require_relative '../config/environment'

prompt = TTY::Prompt.new

pastel = Pastel.new

font = TTY::Font.new("3d")
puts pastel.red(font.write('Hello'))
puts pastel.green(font.write('World'))

user = User.new_user(prompt)

def run(prompt, user)
  choices = ["New Game", "My Highscore", "Leaderboard", "Delete Games", "Exit"]

  input = prompt.select("Menu", choices)
  if input == "New Game"
    game = Game.new_game(user)
    game.play(prompt)
    puts game.display_game_score
    sleep(1.2)
    run(prompt, user)
  elsif input == "My Highscore"
    puts user.my_highscore
    run(prompt, user)
  elsif input == "Leaderboard"
    User.leaders_table
    run(prompt, user)
  elsif input == "Delete Games"
   user.delete_games(prompt, user)
   run(prompt, user)
  elsif input == "Exit"
    puts "BYEEEEEE"
  end
end
# binding.pry
# Country.compare_pop_question

run(prompt, user)
puts "HELLO WORLD"
