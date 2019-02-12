class User < ActiveRecord::Base
  has_many :games

  def self.new_user(prompt)
    name = prompt.ask('What is your name?')
    User.create(name: name)
  end


end
