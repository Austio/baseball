class PlayerTeam < ActiveRecord::Base
  has_one :player
  has_one :team

end