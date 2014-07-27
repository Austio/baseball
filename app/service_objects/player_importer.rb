class PlayerImporter < FileImporter

  def parse_csv
    lines   = CSV.read(file)
    columns = format_column(lines.shift)
    create_players(columns, lines)
  end

  def create_players(attributes,stats)
    stats.each do |stat|
      player_hash = to_hash(attributes, stat)
      Player.where(player_hash).first_or_create
    end
  end
end