class Team < ActiveRecord::Base
  has_many :player_teams
  has_many :players, through: :player_teams

  def self.team_name(name)
    where("name = ?", name.upcase)
  end
end
