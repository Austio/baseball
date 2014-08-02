
class TripleCrown

  def self.calculate(league,year,at_bats=400)
    league = league.upcase
    stat    = BattingStatistic.from_year(year).from_league(league).min_ab(at_bats)
    result = find_crown(stat)
    puts "Triple Crown for #{year}:#{league} - #{result}"
  end

  def self.find_crown(stat)
    candidates = find_max(stat,"rbi")
    ["hr","batting_average"].each do |attribute|
      current = find_max(stat, attribute)
      candidates.keep_if { |player| current.include? player}
    end

    return "(NO MATCHES)" if candidates.empty?
    return "#{candidates.join(',')}"
  end

  def self.find_max(stats,attribute)
    players= []
    max    = -1
    stats.each do |stat|

      result = stat.send(attribute) || 0
      if max == result
        players << stat.player.name
      elsif max < result
        max = result
        players = [stat.player.name]
      end

    end
    return players
  end

  def self.find_max_(stats, attributes)


  end






end