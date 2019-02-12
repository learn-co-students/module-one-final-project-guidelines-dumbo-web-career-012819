require_relative '../../config/environment'


class Country < ActiveRecord::Base

  def self.compare_pop_question
    prompt = TTY::Prompt.new

    country1 = self.rand_country
    country2 = self.rand_country
    answer = country1.population > country2.population ? country1.name : country2.name

    choices = [country1.name, country2.name]
    input = prompt.select("Which country has a larger population?", choices)
    # binding.pry

    if input == answer
      puts "CORRECTO MUNDO!"
    else
      puts "WRONG!"
    end
  end


  def self.rand_country
    rand_num = rand(Country.count)
    self.all[rand_num]
  end

end
