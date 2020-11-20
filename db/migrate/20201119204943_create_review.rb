class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :stars
      t.integer :hearts
      t.integer :book_id
      t.integer :user_id
    end
  end
end
