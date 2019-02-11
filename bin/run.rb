require_relative '../config/environment'
require_relative '../lib/character.rb'
require 'tty-prompt'
require 'tty-table'


puts "Welcome to the Game of Thrones character quiz. Take this quiz to see which character you are!"


def user_check(username)
	User.find_or_create_by(name: username)
end

def welcome 
 #new account --> create_user
 #load account -->load_method
 #delete account
	
end

def create_user
	puts "Please enter your name:"
	name = gets.chomp
	user = user_check(name)
	user = User.create(name: name)

	main_menu


end

def main_menu
	menu = [
		{"Take the quiz" => -> do take_quiz end},
		{"View quiz history" => -> do view_history end},
		{"Update user name" => -> do update_name end},
		{"Clear quiz history" => -> do clear_history end},
		{"View list of all characters" => -> do character_list end},
		{"Exit" => -> do exit_app end}
	]
	prompt = TTY::Prompt.new
	decision = prompt.select("Choose something", menu)
	main_menu
end

def character_list
	binding.pry
	GOTCharacter.characters.each do |name, id|
		puts name
	end
end

def exit_app
	
end

create_user