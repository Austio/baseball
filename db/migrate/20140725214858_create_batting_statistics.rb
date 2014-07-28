class CreateBattingStatistics < ActiveRecord::Migration
  def change
    create_table :batting_statistics do |t|
      t.integer :g
      t.integer :ab
      t.integer :r
      t.integer :h
      t.integer :double
      t.integer :triple
      t.integer :hr
      t.integer :rbi
      t.integer :sb
      t.integer :cs
      t.integer :stat_id

      t.timestamps
    end
  end
end
