class CreateBattingStatistics < ActiveRecord::Migration
  def change
    create_table :batting_statistics do |t|
      t.integer :g
      t.integer :ab
      t.integer :r
      t.integer :h
      t.integer '2_b'
      t.integer '3_b'
      t.integer :hr
      t.integer :rbi
      t.integer :sb
      t.integer :cs

      t.timestamps
    end
  end
end
