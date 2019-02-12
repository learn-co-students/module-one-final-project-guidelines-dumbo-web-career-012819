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

def prompt
	TTY::Prompt.new
end

def create_user
	puts "Please enter your name:"
	name = gets.chomp
	user = user_check(name)
	main_menu(user)
end

def main_menu(user)
	prompt.select("Choose something") do |menu|
		menu.choice 'Take the quiz!', -> {question1(user)}
		menu.choice 'View the list of all characters', -> {character_list}
		menu.choice 'View your quiz history', -> {quiz_history(user)}
		menu.choice 'Delete your quiz history', -> {delete_user(user)}
		menu.choice 'Exit', -> {exit_app}
	end
	main_menu(user)
end

def question1(user)
	new_test = Test.create(user_id: user.id, character_id: nil, score: 0)
	prompt.select("What is your goal in life?") do |menu|
		 menu.choice 'My goal is to protect the world and those closest to me', -> {new_test.score += 0}
		 menu.choice 'I want to get rich or die trying', -> {new_test.score += 3}
		 menu.choice "I don't care", -> {new_test.score += 5}
		 menu.choice 'I want to watch the world burn', -> {new_test.score += 10}
	end
	new_test.save
	question2(user, new_test)
end

def question2(user, new_test)
	
end

def question6(user, new_test)
	promp.select("What is the greatest threat to Wesrteros?") do |menu|
		menu.choice 'White walkers', -> {test.score += 0}
	end
end

def question7(user)
	
end

def question8(user)
	
end

def question9(user)
	
end

def question10(user)
	
end

def quiz_history(user)
	user.tests.each do |test|
		puts test.score
	end
end

def character_list
	GotCharacter.all.each do |character|
		puts character.name
	end
end

def exit_app
	exit
end

create_user