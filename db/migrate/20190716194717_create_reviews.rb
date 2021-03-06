class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.integer :restaurant_id
      t.integer :user_id
      t.string  :price
      t.timestamps
    end
  end
end
