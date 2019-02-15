class CreateQuestionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :game_id
    end
  end
end
