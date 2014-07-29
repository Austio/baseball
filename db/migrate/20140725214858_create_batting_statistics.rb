class CreateBattingStatistics < ActiveRecord::Migration
  def change
    create_table :batting_statistics do |t|
      t.integer :g,         :default => 0
      t.integer :ab,        :default => 0
      t.integer :r,         :default => 0
      t.integer :h,         :default => 0
      t.integer :double,    :default => 0
      t.integer :triple,    :default => 0
      t.integer :hr,        :default => 0
      t.integer :rbi,       :default => 0
      t.integer :sb,        :default => 0
      t.integer :cs,        :default => 0
      t.integer :stat_id

      t.timestamps
    end
  end
end
