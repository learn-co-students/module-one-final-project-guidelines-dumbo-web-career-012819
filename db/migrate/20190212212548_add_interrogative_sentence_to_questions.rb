class AddInterrogativeSentenceToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :interrogative_sentence, :string;
    add_column :questions, :answer, :string
  end
end
