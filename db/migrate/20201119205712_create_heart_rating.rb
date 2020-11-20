class CreateHeartRating < ActiveRecord::Migration
  def change
    create_table :heart_ratings do |t|
      t.integer :rating
      t.integer :user_id
      t.integer :book_id
    end
  end
end
