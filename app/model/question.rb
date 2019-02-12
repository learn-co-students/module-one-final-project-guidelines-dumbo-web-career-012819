class Question < ActiveRecord::Base
  belongs_to :game

  # @@questions_templates = [method(:compare_pop_question)]
  def self.generate_q1(prompt, game)
    this_question = self.create(game_id: game.id)

    country1 = Country.all.sample
    country2 = Country.all.sample
    answer = country1.population > country2.population ? country1.name : country2.name

    choices = [country1.name, country2.name]
    input = prompt.select("Which country has a larger population?", choices)
    # binding.pry

    if input == answer
      puts "CORRECTO MUNDO!"
      this_question.game.increment!(:total_points)
    else
      puts "WRONG!"
    end
  end

  def self.generate_q2(prompt, game)
    prompt = TTY::Prompt.new
    this_question = self.create(game_id: game.id)

    country1 = Country.all.sample
    country2 = Country.all.sample
    answer = country1.total_area > country2.total_area ? country1.name : country2.name

    choices = [country1.name, country2.name]
    input = prompt.select("Which country has a larger land mass?", choices)
    # binding.pry

    if input == answer
      puts "CORRECTO MUNDO!"
      this_question.game.increment!(:total_points)
    else
      puts "WRONG!"
    end
  end

  def self.generate_q3(prompt, game)
    this_question = self.create(game_id: game.id)

    country1 = Country.all.sample
    country2 = Country.all.sample
    country3 = Country.all.sample
    answer = country2.capital
    choices = [country1.capital, country2.capital, country3.capital]
    input = prompt.select("What is the capital of #{country2.name}", choices)
    if input == answer
      puts "CORRECTO MUNDO!"
      this_question.game.increment!(:total_points)
    else
      puts "WRONG!"
    end
  end

  def self.generate_q4(prompt, game)
    this_question = self.create(game_id: game.id)

    country1 = Country.all.sample
    country2 = Country.all.sample
    country3 = Country.all.sample
    answer = country3.government_type
    choices = [country1.government_type, country2.government_type, country3.government_type]
    input = prompt.select("What is the system of government of #{country3.name}", choices)
    if input == answer
      puts "CORRECTO MUNDO!"
      this_question.game.increment!(:total_points)
    else
      puts "WRONG!"
    end
  end

  def self.generate_q5(prompt, game)
    this_question = self.create(game_id: game.id)

    country1 = Country.all.sample
    country2 = Country.all.sample
    country3 = Country.all.sample
    answer = country1.name
    choices = [country1.name, country2.name, country3.name]
    input = prompt.select("What country does this excerpt describe: \n #{country1.background.gsub!(country1.name, "******")}", choices)
    if input == answer
      puts "CORRECTO MUNDO!"
      this_question.game.increment!(:total_points)
    else
      puts "WRONG!"
    end
  end

  def self.generate_q6(prompt, game)
    this_question = self.create(game_id: game.id)

    rand_country = Country.all.sample
    all_lang = []
    Country.all.each do |country|
      langs = country.languages.split(" ")
      all_lang << langs[0]
    end
    all_lang = all_lang.uniq
    languages = rand_country.languages.split(" ")
    choice_arr = [all_lang.sample, languages[0], all_lang.sample]
    choice1 = choice_arr.sample
    choice_arr.delete(choice1)
    choice2 = choice_arr.sample
    choice_arr.delete(choice2)
    choice3 = choice_arr.sample
    user = prompt.select("What is the most popular language in #{rand_country.name}?") do |menu|
      menu.choice choice1
      menu.choice choice2
      menu.choice choice3
    end
    if user == languages[0]
      puts "That is correct"
      this_question.game.increment!(:total_points)
    else
      puts "That is wrong"
    end
 end

 def self.generate_q7(prompt, game)
   this_question = self.create(game_id: game.id)

   country_by_letter = Hash.new(0)
   Country.all.each do |country|
     country_by_letter[country.name[0]] += 1
   end
   abc = ["A", "B","C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U","V","W", "X", "Y", "Z"]
   letter = abc.sample
   correct_num = country_by_letter[letter]
   range1 = correct_num - rand(10)
   range2 = correct_num + rand(10)
   incorrect_num1 = rand(range1..range2)
   incorrect_num2 = rand(range1..range2)
   binding.pry
   if incorrect_num2 < 0 || incorrect_num2 == correct_num
     incorrect_num2 = correct_num + 10
   elsif incorrect_num1 < 0 || incorrect_num1 == correct_num
     incorrect_num1 = correct_num + 10
   end
   choice_arr = [correct_num, incorrect_num2, incorrect_num1,]
     choice1 = choice_arr.sample
     choice_arr.delete(choice1)
     choice2 = choice_arr.sample
     choice_arr.delete(choice2)
     choice3 = choice_arr.sample

   user = prompt.select("How many countries begin with the letter: #{letter}?") do |menu|
       menu.choice choice1
       menu.choice choice2
       menu.choice choice3
     end
     if user.to_i == correct_num
       puts "That is correct"
       this_question.game.increment!(:total_points)
     else
       puts "That is wrong"
     end
 end
end
