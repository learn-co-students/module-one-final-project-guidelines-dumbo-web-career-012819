class User < ActiveRecord::Base
  has_many :games

  def self.new_user(prompt)
    name = prompt.ask('What is your name?')
    self.check_user(name)
  end

  def self.check_user(name)
    if User.all.any? {|user| user.name == name}
       user = User.find_by(name: name)
   else
       User.create(name: name)
   end
 end

 def my_highscore
   self.games.max_by do |game|
     game.total_points
   end.total_points
 end

 def delete_games(prompt, user)
   puts "Delete your games? Are you sure? Type 'y' to delete"
   yes_delete = gets.chomp
   if yes_delete == "y"
     user.games.destroy_all
     puts "Also delete all users? Type code to delete users"
     admin = gets.chomp
     if admin == "admin"
       puts "Press 'y' to confirm"
       confirm_delete_users = gets.chomp
       if confirm_delete_users == "y"
         User.delete_users
         run(prompt, user)
       else
         run(prompt, user)
       end
     end
     run(prompt, user)
   else
     run(prompt, user)
   end
 end

 def self.delete_users
   self.all.destroy_all
 end

def self.leaders_table
  list = []

  users = User.all.sort{|user1, user2| user1.my_highscore <=> user2.my_highscore}.reverse
  users.each_with_index {|user, index| list << "#{index + 1}. #{user.name} | #{user.my_highscore} |"}
  # binding.pry
  list.each do |user|
      puts "________________________________"
      puts user
      puts "________________________________"
    end
  end
end

#{index+1}. #{game.user.name} |   #{game.user.points} |” }
