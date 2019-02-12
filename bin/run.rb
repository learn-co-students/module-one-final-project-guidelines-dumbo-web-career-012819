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
	prompt = TTY::Prompt.new
	prompt.select("Choose something") do |menu|
		menu.choice 'View the list of all characters', -> {character_list}
		menu.choice 'Exit', -> {exit_app}
	end
	main_menu
end

def character_list
	GOTCharacter.all.each do |character|
		puts character.name
	end
end

def exit_app
	exit
end

create_user