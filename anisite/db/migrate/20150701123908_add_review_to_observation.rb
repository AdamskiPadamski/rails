class AddReviewToObservation < ActiveRecord::Migration
  def change
    add_column :observations, :review, :text
  end
end
