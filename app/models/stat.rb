class Stat < ActiveRecord::Base
  belongs_to :player
  belongs_to :team
  has_one    :batting_statistic
  #has_one    :pitching_statistic

  scope :from_year,   ->(year  )    { where("year = ?", year) }
  scope :from_team,   ->(team_name) {joins(:team).where(:teams => {:name => team_name.upcase})}
  scope :from_league, ->(league)    {joins(:team).where(:teams => {:league => league.upcase})}
  scope :min_games,   ->(games)     {joins(:batting_statistic).where('batting_statistics.g >= ?',games)}
  scope :min_ab,      ->(at_bats)   {joins(:batting_statistic).where('batting_statistics.ab >= ?',at_bats)}

end
