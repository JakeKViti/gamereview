class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.string :developer
      t.string :age
      t.datetime :released_date

      t.timestamps
    end
  end
end
