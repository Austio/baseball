
class TripleCrown

  def self.calculate(league,year,at_bats=400)
    stat    = Stat.from_year(year).from_league(league.upcase).min_ab(at_bats)
    result = find_crown(stat)
    puts "Triple Crown for #{year}:#{league} - #{result}"
  end

  def self.find_crown(stat)
    players = find_max(stat,"rbi")
    ["hr","batting_average"].each do |attribute|
      current = find_max(stat, attribute)
      players.keep_if { |player| current.include? player}
    end

    return "(NO MATCHES)" if players.empty?
    return "#{players}"
  end

  def self.find_max(stat,attribute)
    players= []
    max    = -50000
    stat.each do |s|
      result = s.batting_statistic.send(attribute) || 0
      if max == result
        players << s.player.name
      elsif max < result
        max = result
        players = [s.player.name]
      end

    end
    return players
  end






end