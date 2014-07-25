class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name_first
      t.string :name_last
      t.string :player_id
      t.integer :birth_year
      t.integer :statistic_id
      t.integer :player_team_id

      t.timestamps
    end
  end
end
