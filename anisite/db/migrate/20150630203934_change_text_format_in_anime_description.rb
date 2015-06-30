class ChangeTextFormatInAnimeDescription < ActiveRecord::Migration
  def change
      change_column :anime, :description, :text
  end
end
