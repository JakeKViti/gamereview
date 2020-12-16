class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :body
      t.integer :rating
      t.belongs_to :user
      t.belongs_to :game

      t.timestamps
    end
  end
end
