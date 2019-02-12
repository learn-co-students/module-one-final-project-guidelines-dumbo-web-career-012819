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
	question7(user, new_test)
end

def question2(user, new_test)
	
end

def question6(user, new_test)
	prompt.select("What is the greatest threat to Westeros?") do |menu|
		menu.choice 'White walkers', -> {new_test.score += 0}
		menu.choice 'The Targaryens/Dragons', -> {new_test.score += 10}
		menu.choice 'The Lannisters', -> {new_test.score += 5}
		menu.choice 'Climate Change', -> {new_test.score += 3}
	end
	new_test.save
	question7(user, new_test)
end

def question7(user, new_test)
	prompt.select("What would you rather do:") do |menu|
		menu.choice 'Take the black', -> {new_test.score += 3}
		menu.choice 'Save the kingdom but sacrifice yourself', -> {new_test.score += 1}
		menu.choice 'Be Gregor Clegane', -> {new_test.score += 10}
		menu.choice 'Bend the knee and dishonor yourself and your house', -> {new_test.score += 4}
	end
	new_test.save
	question8(user, new_test)
end

def question8(user, new_test)
	prompt.select("You're travling to a distant land with a group and decide to set up camp. Quickly you realize that there's not enough food for everyone, what do you do?") do |menu|
		menu.choice "Kill everyone else and eat to your heart's content", -> {new_test.score += 10}
		menu.choice 'Suggest a free for all to determine who gets fed', -> {new_test.score += 8}
		menu.choice 'Make sure everyone else is fed before you take anything', -> {new_test.score += 0}
		menu.choice 'Evenly distribute the food', -> {new_test.score += 2}
	end
	new_test.save
	question9(user, new_test)
end

def question9(user, new_test)
	prompt.select("You're on the Kingsroad and you come across an injured person that's unconcious. What do you do?") do |menu|
		menu.choice 'Kill them to ease their suffering', -> {new_test.score += 9}
		menu.choice 'Ignore them and keep moving', -> {new_test.score += 8}
		menu.choice 'Do your best to heal them', -> {new_test.score += 3}
		menu.choice 'Take them to the nearest town to get help', -> {new_test.score += 1}
	end
	new_test.save
	question10(user, new_test)
end

def question10(user, new_test)
	prompt.select("You're surrounded by an army far superior to yours and the enemy general is asking for you to surrender. What will you do?") do |menu|
		menu.choice 'Fight to the last man', -> {new_test.score += 1}
		menu.choice 'Run away', -> {new_test.score += 6}
		menu.choice 'Surrender and hope for the best', -> {new_test.score += 3}
		menu.choice 'Pretend to negotiate but attempt an assassination', -> {new_test.score += 9}
	end
	new_test.save
	question11(user, new_test)
end

def question11(user, new_test)
	prompt.select("Your lord of your house dies unexpectadly and there is no heir. What do you do?") do |menu|
		menu.choice 'Get rid of all competition', -> {new_test.score += 10}
		menu.choice 'Work to place a lord that is easy to manipulate', -> {new_test.score += 8}
		menu.choice 'Arrange a vote', -> {new_test.score += 0}
		menu.choice 'Arrange a tournament', -> {new_test.score += 3}
	end
	new_test.save
	display_character_match(user, new_test)
end

def display_character_match(user, new_test)
	main_menu(user)
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