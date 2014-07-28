class BattingImporter < FileImporter

  def parse_csv
    lines = CSV.read(file, :row_sep => :auto, :col_sep => ",")
    column = format_column(lines.shift)
    create_statistics(column, lines)
  end

  def create_statistics(attributes,statistics)
    statistics.each do |stat|
      stat = to_hash(attributes,stat)
      stat = format_stat(stat)
      player_id = find_or_create_player_id(stat.delete('player_id'))
      team_id   = find_or_create_team_id(stat.delete('team_id'),stat.delete('league'))
      year      = stat.delete('year_id')


      PlayerTeam.where(player_id: player_id, team_id: team_id, year: year).first_or_create

      add_batting_stat(player_id, team_id, year, stat)

    end
  end

  def format_stat(stat)
    stat["double"] = stat.delete("2_b")
    stat["triple"] = stat.delete("3_b")
    stat
  end


  def add_batting_stat(player_id, team_id, year, statistic_hash)
    stat = Stat.where(player_id: player_id, team_id: team_id, year: year).first_or_create
    puts statistic_hash
    puts stat
    if stat.batting_statistic_id
      stat.batting_statistic.update(statistic_hash)
    else
      stat.create_batting_statistic(statistic_hash)
    end

  end
end