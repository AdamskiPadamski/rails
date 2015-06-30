class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.string :written_comment

      t.timestamps null: false
    end
  end
end
