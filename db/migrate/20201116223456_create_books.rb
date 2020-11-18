class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :summary
      t.text :img_url
      t.integer :user_id
    end
  end
end
