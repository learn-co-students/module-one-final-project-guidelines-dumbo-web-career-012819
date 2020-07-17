class User < ActiveRecord::Base
	has_many :tests
	has_many :got_characters, through: :tests
end