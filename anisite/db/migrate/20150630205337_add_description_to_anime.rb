class AddDescriptionToAnime < ActiveRecord::Migration
  def change
    add_column :animes, :description, :text
  end
end
