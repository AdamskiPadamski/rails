class AddRatingToObservation < ActiveRecord::Migration
  def change
    add_column :observations, :rating, :integer
  end
end
