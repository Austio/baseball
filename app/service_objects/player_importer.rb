class PlayerImporter < FileImporter

  def parse_csv
    require 'csv'
    lines = CSV.read(file)
    columns = format_column(lines.shift)
    create_players(columns, lines)
  end

  def create_players(attributes,players)
    players.each do |player|
      Player.create(to_hash(attributes, player))
    end
  end
end