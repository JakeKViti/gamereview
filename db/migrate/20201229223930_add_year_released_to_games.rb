class AddYearReleasedToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :year_released, :integer
  end
end
