class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string :title
      t.integer :year
      t.integer :number_of_episodes

      t.timestamps null: false
    end
  end
end
