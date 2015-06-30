class RemoveDescriptionFromAnime < ActiveRecord::Migration
  def change
    remove_column :animes, :description, :string
  end
end
