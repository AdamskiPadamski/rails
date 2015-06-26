class AddAnimeIdToObservation < ActiveRecord::Migration
  def change
    add_column :observations, :anime_id, :integer
  end
end
