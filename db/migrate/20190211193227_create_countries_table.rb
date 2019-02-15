class CreateCountriesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :background
      t.integer :total_area
      t.integer :population
      t.string :government_type
      t.string :capital
      t.string :languages
    end
  end
end
