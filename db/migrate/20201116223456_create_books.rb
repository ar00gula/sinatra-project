class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :summary
      t.text :img_url
      t.integer :user_id
      t.integer :user_stars
      t.integer :user_hearts
      t.string :series
    end
  end
end
