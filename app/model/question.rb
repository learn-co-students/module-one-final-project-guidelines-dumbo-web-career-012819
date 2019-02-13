class Question < ActiveRecord::Base
  belongs_to :game

  @@right_answer_box = TTY::Box.frame(
   width: 150,
   height: 10,
   align: :center,
   padding: 3,
   border: :thick,
   style: {
   fg: :black,
   bg: :green}

  ) do "WOOOHOOO" end;


  # @@questions_templates = [method(:compare_pop_question)]
  def self.generate_q1(prompt, game)
    country1 = Country.all.sample
    country2 = Country.all.sample
    answer = country1.population > country2.population ? country1.name : country2.name

    this_question = self.create(game_id: game.id, interrogative_sentence: "Which country has a larger population?", answer: answer)
    choices = [country1.name, country2.name]
    input = prompt.select("Which country has a larger population?", choices)
    # binding.pry

    self.answer_box(answer, input, this_question)
  end

  def self.generate_q2(prompt, game)
    country1 = Country.all.sample
    country2 = Country.all.sample
    answer = country1.total_area > country2.total_area ? country1.name : country2.name

    this_question = self.create(game_id: game.id, interrogative_sentence: "Which country has a larger land mass?", answer: answer)

    choices = [country1.name, country2.name]
    input = prompt.select("Which country has a larger land mass?", choices)
    # binding.pry

    self.answer_box(answer, input, this_question)
  end

  def self.generate_q3(prompt, game)

    country1 = Country.all.sample
    country2 = Country.all.sample
    country3 = Country.all.sample
    answer = country1.capital

    this_question = self.create(game_id: game.id, interrogative_sentence: "What is the capital of #{country1.name}", answer: answer)

    input = multiple_choice_rand(prompt, this_question, answer, country2.capital, country3.capital)
    self.answer_box(answer, input, this_question)
  end

  def self.generate_q4(prompt, game)

    country1 = Country.all.sample
    country2 = Country.all.sample
    country3 = Country.all.sample
    answer = country1.government_type

    this_question = self.create(game_id: game.id, interrogative_sentence: "What is the system of government of #{country1.name}", answer: answer)

    input = multiple_choice_rand(prompt, this_question, answer, country2.government_type, country3.government_type)
    self.answer_box(answer, input, this_question)
  end

  def self.generate_q5(prompt, game)
    country1 = Country.all.sample
    country2 = Country.all.sample
    country3 = Country.all.sample
    answer = country1.name

    this_question = self.create(game_id: game.id, interrogative_sentence: "What country does this excerpt describe: \n #{country1.background.gsub!(/#{country1.name}/i, "******")}", answer: answer)

    input = multiple_choice_rand(prompt, this_question, answer, country2.name, country3.name)
    self.answer_box(answer, input, this_question)
  end

  def self.generate_q6(prompt, game)
    rand_country = Country.all.sample
    all_lang = []

    Country.all.each do |country|
      langs = country.languages.split(" ")
      all_lang << langs[0]
    end
    all_lang = all_lang.uniq
    languages = rand_country.languages.split(" ")
    answer = languages[0]

    this_question = self.create(game_id: game.id, interrogative_sentence: "What is the most popular language in #{rand_country.name}?", answer: answer)

    input = multiple_choice_rand(prompt, this_question, answer, all_lang.sample, all_lang.sample)
    self.answer_box(answer, input, this_question)
 end

 def self.generate_q7(prompt, game)
   country_by_letter = Hash.new(0)
   Country.all.each do |country|
     country_by_letter[country.name[0]] += 1
   end
   abc = ["A", "B","C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U","V","W", "X", "Y", "Z"]
   letter = abc.sample
   correct_num = country_by_letter[letter]
   this_question = self.create(game_id: game.id, interrogative_sentence: "How many countries begin with the letter: #{letter}?", answer: correct_num)

   range1 = correct_num - rand(5..10)
   range2 = correct_num + rand(5..10)
   incorrect_num1 = rand(range1..range2)
   incorrect_num2 = rand(range1..range2)
   if incorrect_num2 <= 0 || incorrect_num2 == correct_num || incorrect_num2 == incorrect_num1
     incorrect_num2 = correct_num + 10
   end
   if incorrect_num1 <= 0 || incorrect_num1 == correct_num
     incorrect_num1 = correct_num + 10
   end
   input = self.multiple_choice_rand(prompt, this_question, correct_num, incorrect_num1, incorrect_num2)
   self.answer_box(correct_num, input, this_question)
 end

 def self.multiple_choice_rand(prompt, question, correct, wrong, wrong2)
   choice_arr = [correct, wrong, wrong2].shuffle

   prompt.select(question.interrogative_sentence) do |menu|
     menu.choice choice_arr[0]
     menu.choice choice_arr[1]
     menu.choice choice_arr[2]
   end
 end

 def self.answer_box(answer, input, question)
   if input == answer
      puts @@right_answer_box
      pid = fork{ exec 'afplay', "media/Homer-Woohoo!(1).wav" }
      question.game.increment!(:total_points)
      # “afplay ../sound/Homer-Woohoo!(1).wav”
   else
      puts self.generate_wrong_box(answer)
      # afplay “../sound/Homer-D’oh!(1).wav”
      pid = fork{ exec 'afplay', "media/Homer-D'oh!(1).wav" }
   end
 end

 def self.generate_wrong_box(answer)

   @@wrong_answer_box = TTY::Box.frame(
    width: 150,
    height: 10,
    align: :center,
    padding: 3,
    border: :thick,
    style: {
    fg: :black,
    bg: :red}
   ) do "#{answer}" end;

 end
end
