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

end
