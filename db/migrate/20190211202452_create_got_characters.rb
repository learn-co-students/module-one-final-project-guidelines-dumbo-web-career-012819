class CreateGotCharacters < ActiveRecord::Migration[5.0]
  def change
  	create_table :got_characters do |t|
  		t.string :name
  		t.integer :score
  	end
  end
end
