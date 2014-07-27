class BattingImporter < FileImporter

  def parse_csv
    lines = CSV.read(file, :row_sep => :auto, :col_sep => ",")
    column = format_column(lines.shift)
    create_statistics(column, lines)
  end

  def create_statistics(attributes,statistics)
    statistics.each do |stat|
      stat = to_hash(attributes,stat)
      player_id = find_or_create_player_id(stat.delete('player_id'))
      team_id   = find_or_create_team_id(stat.delete('team_id'),stat.delete('league'))
      year      = stat.delete('year_id')

      player_team = PlayerTeam.where(player_id: player_id, team_id: team_id, year: year).first_or_create


      batting_statistic_id = BattingStatistic.create(stat).id
      add_batting_stat(player_id, team_id, year, batting_statistic_id)

    end
  end


  def add_batting_stat(player_id, team_id, year, batting_statistic_id)
    stat = Stat.where(player_id: player_id, team_id: team_id, year: year).first_or_create
    stat.update(batting_statistic_id: batting_statistic_id)
  end
end