require_relative "config/environment.rb"

def compare_pop_question
  prompt = TTY::Prompt.new

  country1 = Country.all.sample
  country2 = Country.all.sample
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

def compare_area_question
  prompt = TTY::Prompt.new

  country1 = Country.all.sample
  country2 = Country.all.sample
  answer = country1.total_area > country2.total_area ? country1.name : country2.name

  choices = [country1.name, country2.name]
  input = prompt.select("Which country has a larger land mass?", choices)
  # binding.pry

  if input == answer
    puts "CORRECTO MUNDO!"
  else
    puts "WRONG!"
  end
end
