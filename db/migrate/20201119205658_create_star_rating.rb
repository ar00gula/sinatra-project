class CreateStarRating < ActiveRecord::Migration
  def change
    create_table :star_ratings do |t|
      t.integer :rating
      t.integer :user_id
      t.integer :book_id
    end
  end
end
