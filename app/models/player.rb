class Player < ActiveRecord::Base
  validates_uniqueness_of :player_id

  belongs_to :player_team
  has_many :teams, through: :player_teams
  has_many :batting_statistics, through: :stats



end
