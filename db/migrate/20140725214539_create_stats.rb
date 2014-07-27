class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :player_id
      t.integer :year
      t.integer :team_id
      t.integer :batting_statistic_id
      t.integer :pitching_statistic_id

      t.timestamps
    end
  end
end
