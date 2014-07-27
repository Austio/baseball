class FileImporter
  require 'csv'

  attr_reader :file

  def initialize(file)
    @file = file
  end

  def format_column(column)
    column.collect{|line| line.underscore}
  end

  def to_hash(column,line)
    Hash[column.zip line]
  end

  def find_or_create_player_id(player_id)
    player_id.downcase!
    Player.select(:id).where(:player_id => player_id).first_or_create.id
  end

  def find_or_create_team_id(team_name,league)
    team_name.upcase!
    league.upcase!
    Team.select(:id).where(:name => team_name, :league => league).first_or_create.id
  end

end