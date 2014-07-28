class Player < ActiveRecord::Base
  validates_uniqueness_of :player_id

  has_many :stats
  has_many :player_teams
  has_many :teams, through: :player_teams
  has_many :batting_statistics, through: :stats


end
